require('mason-null-ls').setup {
  automatic_installation = true,
  ensure_installed = { 'prettierd', 'stylua' },
}

require('mason-null-ls').check_install(true)
