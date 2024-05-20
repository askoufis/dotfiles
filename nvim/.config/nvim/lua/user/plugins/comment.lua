return {
  -- Context-aware comments via treesitter
  'JoosepAlviste/nvim-ts-context-commentstring',
  config = function(_, opts)
    -- Workaround to make nvim-ts-context-commentstring work with native comments
    -- https://github.com/neovim/neovim/issues/28830#issuecomment-2119690661
    local get_option = vim.filetype.get_option
    vim.filetype.get_option = function(filetype, option)
      return option == 'commentstring' and require('ts_context_commentstring.internal').calculate_commentstring()
        or get_option(filetype, option)
    end
    require('ts_context_commentstring').setup(opts)
  end,
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    enable_autocmd = false,
  },
}
