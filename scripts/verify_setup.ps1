[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$ProjectRoot = (Resolve-Path -LiteralPath (
    Join-Path -Path $PSScriptRoot -ChildPath ".."
)).Path

$RequiredFiles = @(
    ".gitignore"
    "README.md"
    "WORKSTATION_SETUP.md"
    "SECURITY.md"
    "TROUBLESHOOTING.md"
    "AGENTS.md"
    "main.py"
    "scripts/verify_setup.ps1"
    "LICENSE"
)

$FailureCount = 0

function Write-Check {
    param(
        [Parameter(Mandatory = $true)]
        [bool]$Passed,

        [Parameter(Mandatory = $true)]
        [string]$SuccessMessage,

        [Parameter(Mandatory = $true)]
        [string]$FailureMessage
    )

    if ($Passed) {
        Write-Host "[OK] $SuccessMessage"
    }
    else {
        Write-Warning $FailureMessage
        $script:FailureCount += 1
    }
}

Write-Host "PyCharm ChatGPT MCP Starter verification"
Write-Host "Project root: $ProjectRoot"
Write-Host ""

$GitCommand = Get-Command -Name "git" -ErrorAction SilentlyContinue
$PythonCommand = Get-Command -Name "python" -ErrorAction SilentlyContinue
if (-not $PythonCommand) {
    $PythonCommand = Get-Command -Name "py" -ErrorAction SilentlyContinue
}

Write-Check -Passed ($null -ne $GitCommand) `
    -SuccessMessage "Git is available." `
    -FailureMessage "Git is not available."
Write-Check -Passed ($null -ne $PythonCommand) `
    -SuccessMessage "Python is available." `
    -FailureMessage "Python is not available."

$GitDirectory = Join-Path -Path $ProjectRoot -ChildPath ".git"
$VirtualEnvironment = Join-Path -Path $ProjectRoot -ChildPath ".venv"

Write-Check `
    -Passed (Test-Path -LiteralPath $GitDirectory -PathType Container) `
    -SuccessMessage ".git directory exists." `
    -FailureMessage ".git directory is missing."
Write-Check `
    -Passed (Test-Path -LiteralPath $VirtualEnvironment -PathType Container) `
    -SuccessMessage ".venv directory exists." `
    -FailureMessage ".venv directory is missing."

foreach ($RelativePath in $RequiredFiles) {
    $FullPath = Join-Path -Path $ProjectRoot -ChildPath $RelativePath
    Write-Check `
        -Passed (Test-Path -LiteralPath $FullPath -PathType Leaf) `
        -SuccessMessage "Required file exists: $RelativePath" `
        -FailureMessage "Required file is missing: $RelativePath"
}

if (
    $GitCommand -and
    (Test-Path -LiteralPath $GitDirectory -PathType Container)
) {
    $BranchOutput = @(
        & $GitCommand.Source -C $ProjectRoot branch --show-current 2>$null
    )
    $Branch = (
        (
            $BranchOutput |
                ForEach-Object { [string]$_ }
        ) -join ""
    ).Trim()

    if ([string]::IsNullOrWhiteSpace($Branch)) {
        $Branch = "(detached or no commits)"
    }
    Write-Host "Branch: $Branch"

    $StatusLines = @(
        & $GitCommand.Source -C $ProjectRoot status --porcelain 2>$null
    )
    if ($StatusLines.Count -eq 0) {
        Write-Host "Working tree: clean"
    }
    else {
        Write-Host "Working tree: changes present ($($StatusLines.Count) entries)"
    }

    $Remotes = @(
        & $GitCommand.Source -C $ProjectRoot remote 2>$null
    )
    if ($Remotes.Count -eq 0) {
        Write-Host "Git remote: not configured"
    }
    else {
        Write-Host "Git remote: present ($($Remotes.Count))"
    }

    $TrackedEnvironmentFiles = @(
        @(
            & $GitCommand.Source -C $ProjectRoot ls-files -- `
                ".env" ".env.*" 2>$null
        ) | Where-Object {
            $_ -and ([string]$_ -ne ".env.example")
        }
    )

    Write-Check `
        -Passed ($TrackedEnvironmentFiles.Count -eq 0) `
        -SuccessMessage "No real .env files are tracked by Git." `
        -FailureMessage "One or more real .env files are tracked by Git."

    $TrackedLocalFiles = @(
        & $GitCommand.Source -C $ProjectRoot ls-files -- `
            ".idea/**" ".venv/**" "venv/**" "env/**" 2>$null
    )

    Write-Check `
        -Passed ($TrackedLocalFiles.Count -eq 0) `
        -SuccessMessage (
            "No IDE or virtual-environment files are tracked by Git."
        ) `
        -FailureMessage (
            "IDE or virtual-environment files are tracked by Git."
        )
}
else {
    Write-Warning "Git repository details could not be inspected."
}

Write-Host ""
if ($FailureCount -eq 0) {
    Write-Host "Verification completed without failures."
    exit 0
}

Write-Warning "Verification completed with $FailureCount failure(s)."
exit 1
