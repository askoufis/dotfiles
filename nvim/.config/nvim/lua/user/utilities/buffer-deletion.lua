local M = {}

local ends_with = function(str, ending)
  return ending == '' or str:sub(-#ending) == ending
end

-- Delete all buffers except for the current buffer, or the NeogitConsole
M.delete_other_buffers = function()
  local buffers = vim.api.nvim_list_bufs()
  local current_buffer = vim.api.nvim_get_current_buf()

  for _, buffer in ipairs(buffers) do
    local is_loaded = vim.api.nvim_buf_is_loaded(buffer)
    local is_current_buffer = buffer == current_buffer

    local buffer_name = vim.api.nvim_buf_get_name(buffer)
    local is_neogit_console_buffer = ends_with(buffer_name, 'NeogitConsole')

    if is_loaded and not is_current_buffer and not is_neogit_console_buffer then
      vim.api.nvim_buf_delete(buffer, {})
    end
  end

  -- Refresh the tabline so deleted buffers disappear
  vim.cmd.redrawtabline()
end

-- Delete all buffers that contain `node_modules` in their name
M.delete_node_modules_buffers = function()
  local buffers = vim.api.nvim_list_bufs()

  for _, buffer in ipairs(buffers) do
    local is_loaded = vim.api.nvim_buf_is_loaded(buffer)

    local buffer_name = vim.api.nvim_buf_get_name(buffer)
    local is_node_modules_buffer = string.find(buffer_name, 'node_modules')

    if is_loaded and is_node_modules_buffer then
      vim.api.nvim_buf_delete(buffer, {})
    end
  end

  -- Refresh the tabline so deleted buffers disappear
  vim.cmd.redrawtabline()
end

return M
