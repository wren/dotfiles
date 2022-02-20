

function _G.basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

-- recursion ftw
function _G.merge(one, two)
  for key,val in pairs(two) do
    if
      one[key] ~= nil
      and type(one[key]) == 'table'
      and type(val) == 'table'
    then
      _G.merge(one[key], val)
    else
      one[key] = val
    end
  end
end


function _G.get_cmd_output(cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()
  return result
end
