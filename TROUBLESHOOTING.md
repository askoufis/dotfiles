# Troubleshooting

A collection of errors/issues and how I fixed them

## Formatting won't work, null-ls fails to attach to buffer

Run `rm /run/user/1000/.prettierd`, or whatever the null-ls log tells you.
Null-ls debug logging can be enabled by setting `debug = true` in the null-ls setup function.
View the logs with `:NullLsLog`.
