local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

local symbol_map = {
  left = '',
  right = ''
}

local function join(left, right)
  local result = {}
  for k, v in pairs(left) do result[k] = v end
  for k, v in pairs(right) do result[k] = v end
  return result
end

return {
  tab_title = tab_title,
  symbol_map = symbol_map,
  join = join,
}
