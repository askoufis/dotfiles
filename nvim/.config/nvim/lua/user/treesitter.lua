local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    max_file_lines = nil, -- Do not enable for files with more than n lines
  }
  -- indent is experimental
  -- indent = { enable = true, disable = { "yaml" } },
}
