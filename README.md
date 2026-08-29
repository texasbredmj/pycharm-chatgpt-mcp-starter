# PyCharm ChatGPT MCP Starter

A small, approval-first starter project for connecting ChatGPT or Codex to
PyCharm through an MCP server on Windows.

## Quick start

1. Review `WORKSTATION_SETUP.md` and `SECURITY.md`.
2. Place the repository at `<PROJECT_PATH>` and open it in PyCharm.
3. Create and select a project-local virtual environment only after approval.
4. In PyCharm, locate the displayed local Streamable HTTP endpoint:
   `http://127.0.0.1:<PORT>/stream`.
5. Copy that exact URL into the ChatGPT MCP server entry.
6. Begin with read-only MCP tools and unlock additional capabilities gradually.
7. Run `scripts/verify_setup.ps1` only after reviewing and approving it.

PyCharm controls the endpoint port. The displayed URL may change after PyCharm
restarts, so copy the currently displayed URL whenever the connection must be
updated.

## Repository contents

- `README.md` — purpose, contents, and quick start.
- `WORKSTATION_SETUP.md` — phased Windows workstation checklist.
- `SECURITY.md` — approval and MCP safety policy.
- `TROUBLESHOOTING.md` — common setup and connection problems.
- `AGENTS.md` — instructions for automated assistants.
- `main.py` — dependency-free Python smoke test.
- `scripts/verify_setup.ps1` — read-only setup verification.
- `.gitignore` — Python, IDE, environment, and secret-file exclusions.
- `LICENSE` — MIT License.

## Safety defaults

- Explain proposed actions before taking them.
- Require explicit approval for every change or execution.
- Keep brave mode off.
- Keep terminal access disabled initially.
- Prefer **Allow once** over persistent authorization.
- Start with read-only MCP tools.
- Never expose credentials, tokens, private keys, or real `.env` files.
- Keep all project operations within `<PROJECT_PATH>`.
