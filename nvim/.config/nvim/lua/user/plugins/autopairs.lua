return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = true,
  opts = {
    check_ts = true,
    ts_config = {
      lua = { 'string', 'source' },
      javascript = { 'string', 'template_string' },
      java = false,
    },
    disable_filetype = { 'TelescopePrompt' },
  },
}
