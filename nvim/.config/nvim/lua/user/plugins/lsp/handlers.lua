local M = {}

M.setup = function()
  vim.diagnostic.config {
    virtual_text = false,
    signs = {
      active = true,
      text = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN] = '',
        [vim.diagnostic.severity.HINT] = '',
        [vim.diagnostic.severity.INFO] = '',
      },
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = 'minimal',
      border = 'rounded',
      source = true,
      header = '',
      prefix = '',
    },
  }

  -- Extending handlers with custom config in this manner is deprecated. Unsure on what to replace
  -- it with.
  --
  -- vim.lsp.handlers['textDocument/references'] = vim.lsp.with(require('fzf-lua').lsp_references, {})
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
  map('n', 'gi', function()
    P("Use default 'gri' instead")
  end, { desc = 'LSP implementations', silent = true })
  map('n', 'gd', function()
    P("Use 'grd' instead")
  end, { desc = 'LSP definitions', silent = true })
  map('n', 'grd', function()
    vim.lsp.buf.definition()
  end, { desc = 'LSP definitions', silent = true })
  map('n', '<F2>', function()
    P("Use default 'grn' instead")
  end, { desc = 'LSP rename', silent = true }) -- Too used to vscode
  map('n', 'gr', function()
    P("Use default 'grr' instead")
  end, { desc = 'LSP references', silent = true })
  map('n', 'gl', vim.diagnostic.open_float)
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

return M
