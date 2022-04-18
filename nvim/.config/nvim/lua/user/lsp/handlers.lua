local prequire = require('prequire')
local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError', text = '' },
    { name = 'DiagnosticSignWarn', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
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
end

local function lsp_highlight_document(client)
  -- Set autocommands conditionally depending on server_capabilities
  if client.resolved_capabilities.document_highlight then
    local lsp_document_highlight = vim.api.nvim_create_augroup('lsp_document_highlight', {})
    vim.api.nvim_create_autocmd('CursorHold', {
      pattern = '*',
      group = lsp_document_highlight,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      pattern = '*',
      group = lsp_document_highlight,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

local function lsp_keymaps(bufnr)
  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  local opts = { silent = true }

  map('n', 'gD', vim.lsp.buf.declaration, opts)
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'gh', vim.lsp.buf.hover, opts)
  map('n', 'gi', vim.lsp.buf.implementation, opts)
  map('n', '<C-s>', vim.lsp.buf.signature_help, opts)
  map('n', '<F2>', vim.lsp.buf.rename, opts) -- Too used to vscode
  map('n', 'gr', vim.lsp.buf.references, opts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  map('n', '[d', function()
    vim.diagnostic.goto_prev { border = 'rounded' }
  end, opts)
  map('n', ']d', function()
    vim.diagnostic.goto_next { border = 'rounded' }
  end, opts)
  map('n', 'gl', vim.diagnostic.open_float, opts)
  map('n', '<leader>q', vim.diagnostic.setloclist, opts)
  map('n', '<leader>f', vim.lsp.buf.formatting_sync, opts)
  map('n', '<leader>lr', ':LspRestart<CR>', opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = prequire('cmp_nvim_lsp')

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
