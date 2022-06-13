P = function(v)
  print(vim.inspect(v))

  return v
end

Reverse = function(list)
  local rev = {}
  for i = #list, 1, -1 do
    rev[#rev + 1] = list[i]
  end

  return rev
end
