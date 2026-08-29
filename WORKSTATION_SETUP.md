# Workstation Setup

Use this phased checklist on a new Windows workstation. Pause for explicit
approval before any installation, configuration change, file change, or
execution.

## Phase 1 — review

- [ ] Read `README.md`, `SECURITY.md`, and `AGENTS.md`.
- [ ] Confirm the intended project location as `<PROJECT_PATH>`.
- [ ] Confirm that no sensitive production project is open.
- [ ] Agree on the initial read-only MCP tool set.

## Phase 2 — prerequisites

- [ ] Confirm that Git is available.
- [ ] Confirm that a supported Python interpreter is available.
- [ ] Confirm that PyCharm is installed.
- [ ] Install or update prerequisites only after explicit approval.

## Phase 3 — project

- [ ] Place the repository at `<PROJECT_PATH>`.
- [ ] Open `<PROJECT_PATH>` as the PyCharm project.
- [ ] Confirm that `.git`, `.idea`, and virtual-environment files are handled as
      intended before staging anything.

## Phase 4 — Python environment

- [ ] After approval, create a project-local `.venv` if one does not exist.
- [ ] Select `<PROJECT_PATH>\.venv\Scripts\python.exe` in PyCharm.
- [ ] Do not install dependencies unless they are explained and approved.

## Phase 5 — MCP connection

- [ ] In PyCharm, locate the displayed local Streamable HTTP endpoint:
      `http://127.0.0.1:<PORT>/stream`.
- [ ] Copy that exact URL into the ChatGPT MCP server entry.
- [ ] Remember that PyCharm controls the port and may display a different URL
      after restarting.
- [ ] Keep terminal access and brave mode disabled.
- [ ] Enable only the read-only tools listed in `SECURITY.md`.
- [ ] Prefer **Allow once** for approval prompts.

## Phase 6 — verification

- [ ] Review `scripts\verify_setup.ps1`.
- [ ] After approval, run it from `<PROJECT_PATH>`.
- [ ] Resolve warnings before enabling write, build, run, or Git-changing tools.
- [ ] Test additional capabilities one at a time with explicit approval.
