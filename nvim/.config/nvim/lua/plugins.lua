-- Bootstrap paq-nvim
-- Code from https://github.com/savq/paq-nvim#bootstrapping
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end
-- End bootstrap

-- Plugins
-- Paq commands:
-- PaqInstall: Install all packages listed in your configuration
-- PaqUpdate: Update all packages already on your system (it won't implicitly install them)
-- PaqClean: Remove all packages (in Paq's directory) that aren't listed on your configuration
-- PaqSync: Execute the three operations listed above

require("paq") {
    "savq/paq-nvim";
}

