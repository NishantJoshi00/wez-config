local wezterm = require "wezterm";
local colors = require "themes.oldworld";

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local symbol_map = require("utils").symbol_map
    local tab_title = require("utils").tab_title

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

    title = wezterm.truncate_right(title, max_width - 2)
    title = wezterm.truncate_left(title, max_width - 2)

    return {
      { Background = { Color = colors.bg_dark } },
      { Foreground = { Color = colors.fg } },
      { Text = (tab.tab_id == tabs[1].tab_id) and " " .. wezterm.nerdfonts.cod_terminal_bash .. " " .. #tabs .. " " or "" },
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
