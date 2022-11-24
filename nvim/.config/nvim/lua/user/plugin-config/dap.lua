-- setup adapters
require('dap-vscode-js').setup {
  debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
  debugger_cmd = { 'js-debug-adapter' },
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
}

local dap = require('dap')

-- -- custom adapter for running tasks before starting debug
-- local custom_adapter = 'pwa-node-custom'
-- dap.adapters[custom_adapter] = function(cb, config)
--   if config.preLaunchTask then
--     local async = require('plenary.async')
--     local notify = require('notify').async
--
--     async.run(function()
--       ---@diagnostic disable-next-line: missing-parameter
--       notify('Running [' .. config.preLaunchTask .. ']').events.close()
--     end, function()
--       vim.fn.system(config.preLaunchTask)
--       config.type = 'pwa-node'
--       dap.run(config)
--     end)
--   end
-- end

-- language config
for _, language in ipairs { 'typescript', 'javascript' } do
  dap.configurations[language] = {
    {
      name = 'Launch',
      type = 'pwa-node',
      request = 'launch',
      program = '${file}',
      rootPath = '${workspaceFolder}',
      cwd = '${workspaceFolder}',
      sourceMaps = true,
      skipFiles = { '<node_internals>/**' },
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      name = 'Attach to node process',
      type = 'pwa-node',
      request = 'attach',
      rootPath = '${workspaceFolder}',
      processId = require('dap.utils').pick_process,
    },
    {
      name = 'Debug Main Process (Electron)',
      type = 'pwa-node',
      request = 'launch',
      program = '${workspaceFolder}/node_modules/.bin/electron',
      args = {
        '${workspaceFolder}/dist/index.js',
      },
      outFiles = {
        '${workspaceFolder}/dist/*.js',
      },
      resolveSourceMapLocations = {
        '${workspaceFolder}/dist/**/*.js',
        '${workspaceFolder}/dist/*.js',
      },
      rootPath = '${workspaceFolder}',
      cwd = '${workspaceFolder}',
      sourceMaps = true,
      skipFiles = { '<node_internals>/**' },
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Debug Jest Tests',
      -- trace = true, -- include debugger info
      runtimeExecutable = 'node',
      runtimeArgs = {
        './node_modules/jest/bin/jest.js',
        '--runInBand',
      },
      rootPath = '${workspaceFolder}',
      cwd = '${workspaceFolder}',
      console = 'integratedTerminal',
      internalConsoleOptions = 'neverOpen',
    },
    -- {
    --   name = 'Compile & Debug Main Process (Electron)',
    --   type = custom_adapter,
    --   request = 'launch',
    --   preLaunchTask = 'npm run build-ts',
    --   program = '${workspaceFolder}/node_modules/.bin/electron',
    --   args = {
    --     '${workspaceFolder}/dist/index.js',
    --   },
    --   outFiles = {
    --     '${workspaceFolder}/dist/*.js',
    --   },
    --   resolveSourceMapLocations = {
    --     '${workspaceFolder}/dist/**/*.js',
    --     '${workspaceFolder}/dist/*.js',
    --   },
    --   rootPath = '${workspaceFolder}',
    --   cwd = '${workspaceFolder}',
    --   sourceMaps = true,
    --   skipFiles = { '<node_internals>/**' },
    --   protocol = 'inspector',
    --   console = 'integratedTerminal',
    -- },
  }
end

local map = function(mode, l, r, opts)
  opts = opts or { silent = true }
  vim.keymap.set(mode, l, r, opts)
end

map('n', '<F5>', dap.continue)
map('n', '<F10>', dap.step_over)
map('n', '<F11>', dap.step_into)
map('n', '<F12>', dap.step_out)
map('n', '<leader>db', dap.toggle_breakpoint)
map('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
map('n', '<leader>dr', dap.repl.open)
map('n', '<leader>dl', dap.run_last)
map('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
map('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
map('v', '<leader>dhv', '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

map('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
map('n', '<leader>duf', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")
