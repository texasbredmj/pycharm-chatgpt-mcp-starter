# Security

## Safe initial MCP tools

Begin with read-only tools such as:

- Project and repository discovery
- Directory-tree listing
- File reading
- Text and symbol searching
- IDE error and warning inspection
- Python-environment inspection
- Git status inspection

Do not initially enable terminal, file-writing, patching, build, run,
refactoring, formatting, package-management, or Git-changing tools.

## Progressive unlocking

1. Verify the project path and repository state with read-only tools.
2. Enable one additional capability only for a defined task.
3. Review its complete parameters before approval.
4. Prefer **Allow once**.
5. Verify the result with read-only tools.
6. Disable the capability again when it is no longer needed.

Keep brave mode off. Keep terminal access disabled unless a specific,
reviewed task cannot be completed safely without it.

## Approval policy

Approval must be explicit, specific, and limited to the displayed operation.
Approval for one file, command, or run does not authorize another. Explain the
expected effects before requesting approval.

## Sensitive projects

- Do not connect MCP to a project containing unreviewed credentials or private
  production data.
- Never read or display real `.env` files, tokens, passwords, private keys, or
  credential stores.
- Confirm that secrets are ignored and not already tracked by Git.
- Avoid broad searches outside `<PROJECT_PATH>`.
- Do not expose remote addresses or authentication details in logs or reports.
- Use a separate practice repository before enabling higher-risk tools.
