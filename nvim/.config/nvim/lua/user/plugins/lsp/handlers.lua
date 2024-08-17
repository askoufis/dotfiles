local M = {}

M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
    { name = 'DiagnosticSignInfo', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/references'] = vim.lsp.with(require('fzf-lua').lsp_references, {})
end

local lsp_document_highlight_group = vim.api.nvim_create_augroup('lsp_document_highlight', {})
local lsp_highlight_document = function(client, bufnr)
  -- Set autocommands conditionally depending on server_capabilities
  if client.server_capabilities.documentHighlight then
    vim.api.nvim_create_autocmd('CursorHold', {
      buffer = bufnr,
      group = lsp_document_highlight_group,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      buffer = bufnr,
      group = lsp_document_highlight_group,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end
end

local lsp_keymaps = function(map)
  map('n', 'gD', vim.lsp.buf.declaration)
  map('n', 'gd', vim.lsp.buf.definition)
  map('n', 'gi', vim.lsp.buf.implementation)
  map('n', '<C-s>', vim.lsp.buf.signature_help)
  map('n', '<F2>', vim.lsp.buf.rename) -- Too used to vscode
  map('n', 'gr', vim.lsp.buf.references)
  map('n', '<leader>ca', vim.lsp.buf.code_action)
  map('n', 'gl', vim.diagnostic.open_float)
  map('n', '<leader>q', vim.diagnostic.setloclist)
  map('n', '<leader>lr', ':LspRestart<CR>')
end

M.on_attach = function(options)
  return function(client, bufnr)
    local map = function(mode, l, r, opts)
      opts = opts or { silent = true }
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    lsp_keymaps(map)
    lsp_highlight_document(client, bufnr)

    if options.disable_formatting then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end

    if client.server_capabilities.documentFormattingProvider then
      map('n', '<leader>f', function()
        vim.lsp.buf.format { async = true }
      end)
    end
  end
end

local cmp_nvim_lsp = require('cmp_nvim_lsp')

M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
