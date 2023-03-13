local M = {}

function M.random_string(length, charset)
  math.randomseed(os.clock())
  local ret = {}
  local r

  for _ = 1, length do
    r = math.random(1, #charset)
    table.insert(ret, charset:sub(r, r))
  end

  return table.concat(ret)
end

return M
