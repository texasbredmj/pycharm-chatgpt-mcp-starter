# Agent Instructions

- Stay within `<PROJECT_PATH>` unless the user explicitly approves another
  scope.
- Begin with read-only inspection and report the current state.
- Explain the exact purpose, targets, parameters, effects, and risks of every
  proposed operation.
- Obtain explicit approval before any file creation, edit, deletion, rename,
  patch, formatting, or refactoring.
- Obtain explicit approval before any environment, interpreter, package, or
  dependency change.
- Obtain explicit approval before every Git change, including staging,
  committing, branch changes, remote changes, or pushing.
- Obtain explicit approval before every build, run, test, terminal command, or
  deployment.
- Treat each approval as one-time and operation-specific.
- Never read, display, store, or commit credentials, tokens, passwords, private
  keys, or real `.env` contents.
- Keep brave mode off and terminal access disabled unless separately approved.
- Preserve unrelated user changes.
- After an approved action, report every affected file and operation.
