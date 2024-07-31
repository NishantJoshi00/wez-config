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

    title = wezterm.truncate_right(title, max_width - 4)
    title = wezterm.truncate_left(title, max_width - 2)

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
wezterm.on('update-right-status', function(window, pane)
  local language_map = require("utils").language_map
  local title = pane:get_title()

  local filename = ""

  if title:sub(-4) == "NVIM" then
    title = title:match("%S+")
    filename = title

    title = title:match("[^.]+$")
  end

  local language = language_map[title]

  if language then
    title = filename .. " " .. language.icon
  else
    title = ""
  end

  window:set_left_status(wezterm.nerdfonts.cod_terminal_bash .. " " .. #pane:window():tabs() .. " ")
  window:set_right_status(title .. " ")
end)
