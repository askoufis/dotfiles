return {
  'numToStr/Comment.nvim',
  event = 'InsertEnter',
  dependencies = { 'nvim-ts-context-commentstring' },
  config = true,
  opts = function()
    return {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
}
