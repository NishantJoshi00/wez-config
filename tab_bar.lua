local wezterm = require("wezterm")

local colors = require("oldworld")

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

local symbol_map = {
  left = ' ',
  right = ''
}

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = colors.bg
    local background = colors.bg_dark
    local foreground = colors.fg

    if tab.is_active then
      background = colors.fg
      foreground = colors.bg
    elseif hover then
      background = colors.bg
      foreground = colors.fg
    end

    local edge_foreground = background

    local title = tab_title(tab)


    title = wezterm.truncate_right(title, max_width - 5)

    return {
      { Background = { Color = edge_foreground } },
      { Foreground = { Color = edge_background } },
      { Text = (tab.is_active or hover) and symbol_map.left or " " },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = " " .. title .. " " },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = (tab.is_active or hover) and symbol_map.left or " " },
    }
  end
)
