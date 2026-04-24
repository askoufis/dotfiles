local parsers = {
  'astro',
  'bash',
  'comment',
  'css',
  'diff',
  'dockerfile',
  'fish',
  'git_config',
  'git_rebase',
  'html',
  'javascript',
  'jsdoc',
  'json',
  'json5',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'query',
  'regex',
  'rust',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
  'yaml',
  'zig',
}

local indentFileTypes = {
  'astro',
  'bash',
  'css',
  'diff',
  'dockerfile',
  'fish',
  'gitconfig',
  'gitrebase',
  'html',
  'json',
  'json5',
  'jsonc',
  'lua',
  'rust',
  'html',
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
  'zig',
  'markdown',
  'rust',
  'toml',
  'vim',
  'yaml',
  'zig',
}

-- TODO: Maybe copy auto-install function from https://github.com/FStanDev/myNvimConfig/blob/e7094bd5aefe405796375d3c1598d74d097e1a50/lua/configs/treesitter.lua
return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = indentFileTypes,
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
    event = { 'BufReadPre', 'BufNewFile' },
  },
}
