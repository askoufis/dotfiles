local ends_with = function(str, ending)
  return ending == '' or str:sub(-#ending) == ending
end

-- Not using `:%bd<CR>` so we can preserve the NeoGit console buffer
local delete_all_buffers = function()
  local buffers = vim.api.nvim_list_bufs()

  for _, buffer in ipairs(buffers) do
    local is_loaded = vim.api.nvim_buf_is_loaded(buffer)

    local buffer_name = vim.api.nvim_buf_get_name(buffer)
    -- NeoGit creates its own invisible buffer that complains if it isn't force-deleted
    -- Intead we'll just skip it to save the hassle
    local is_neogit_console_buffer = ends_with(buffer_name, 'NeogitConsole')

    if is_loaded and not is_neogit_console_buffer then
      vim.api.nvim_buf_delete(buffer, {})
    end
  end

  -- Refresh the tabline so deleted buffers disappear
  vim.cmd.redrawtabline()
end

-- Delete all buffers except for the current buffer, or the NeogitConsole
local delete_other_buffers = function()
  local buffers = vim.api.nvim_list_bufs()
  local current_buffer = vim.api.nvim_get_current_buf()

  for _, buffer in ipairs(buffers) do
    local is_loaded = vim.api.nvim_buf_is_loaded(buffer)
    if not is_loaded then
      goto continue
    end

    local is_current_buffer = buffer == current_buffer
    if is_current_buffer then
      goto continue
    end

    local is_modified = vim.api.nvim_get_option_value('modified', { buf = buffer })
    if is_modified then
      goto continue
    end

    local buffer_name = vim.api.nvim_buf_get_name(buffer)
    -- NeoGit creates its own invisible buffer that complains if it isn't force-deleted
    -- Intead we'll just skip it to save the hassle
    local is_neogit_console_buffer = ends_with(buffer_name, 'NeogitConsole')

    vim.api.nvim_buf_delete(buffer, {})

    ::continue::
  end

  -- Refresh the tabline so deleted buffers disappear
  vim.cmd.redrawtabline()
end

-- Delete all buffers that contain `node_modules` in their name
local delete_node_modules_buffers = function()
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

set_keymap('n', '<leader>bo', delete_other_buffers)
set_keymap('n', '<leader>bd', delete_all_buffers)
set_keymap('n', '<leader>bn', delete_node_modules_buffers)
