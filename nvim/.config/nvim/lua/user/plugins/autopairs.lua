-- Leave these out for now
-- local autopairs_cmp = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
--
-- cmp.event:on('confirm_done', autopairs_cmp.on_confirm_done { map_char = { tex = '' } })

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
