---@diagnostic disable: duplicate-set-field

_G.P = function(v)
  vim.print(v)

  return v
end

_G.Reverse = function(list)
  local rev = {}
  for i = #list, 1, -1 do
    rev[#rev + 1] = list[i]
  end

  return rev
end

_G.set_keymap = function(mode, l, r, opts)
  opts = opts or { silent = true }
  vim.keymap.set(mode, l, r, opts)
end
