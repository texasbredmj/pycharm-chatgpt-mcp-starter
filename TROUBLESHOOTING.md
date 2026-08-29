# Troubleshooting

## Incorrect `projectPath`

Confirm that every MCP request uses the exact PyCharm project root:
`<PROJECT_PATH>`. Do not guess or substitute a parent directory.

## Port changed after PyCharm restarted

PyCharm controls the local endpoint port, and that port may change after a
restart. Copy PyCharm's currently displayed
`http://127.0.0.1:<PORT>/stream` URL and update the ChatGPT MCP server entry
with that exact URL. Do not manually choose or hard-code the PyCharm port.

## Tools missing after configuration changes

Save the tool changes in PyCharm. Fully exit ChatGPT, reopen it, and start a
new chat. Inspect the new chat's tool catalog before attempting the task.

## MCP timeout while awaiting PyCharm confirmation

Check PyCharm for an approval dialog. Review the complete parameters and use
**Allow once** if appropriate. A timed-out client request does not prove that
the underlying process stopped, so inspect state before retrying.

## No run configuration

Use PyCharm to identify an executable gutter location or define a project run
configuration only after approval. Confirm the configuration name and launch
parameters before enabling execution.

## Accidental `.idea` staging

Stop before committing. Inspect Git status, confirm that `.idea/` is in
`.gitignore`, and request explicit approval before removing IDE files from the
index. Recheck Git status afterward without deleting the local IDE directory.
