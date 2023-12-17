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
