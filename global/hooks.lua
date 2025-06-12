local wezterm = require "wezterm";
local colors = require "themes.colors";

wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        local symbol_map = require("utils").symbol_map
        local tab_title = require("utils").tab_title

        local pane = tab.active_pane
        local proc = (pane.foreground_process_name or ""):gsub(".*[/\\]", "")
        local is_running = proc ~= "" and proc ~= "zsh" and proc ~= "bash"

        local edge_background = colors.background
        local background = colors.background
        local foreground = colors.foreground

        if tab.is_active then
            background = colors.foreground
            foreground = colors.background
        elseif hover then
            background = colors.unseen
            foreground = colors.unseen_fg
        elseif is_running then
            background = colors.activity.busy  -- red from theme
            foreground = colors.activity.busy_fg
        end

        local edge_foreground = background

        local title = tab_title(tab)
        if is_running then
            title = title .. " [" .. proc .. "]"
        end

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
