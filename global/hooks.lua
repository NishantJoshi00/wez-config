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

        -- default
        local background = colors.background
        local foreground = colors.foreground
        local title = tab_title(tab)

        if tab.is_active then
            background = colors.foreground
            foreground = colors.background
        elseif hover then
            background = colors.background
            foreground = colors.ansi[2]
        elseif is_running then
            background = colors.background
            foreground = colors.brights[1]
            title = "[" .. proc .. "]"
        end

        title = wezterm.truncate_right(title, max_width - 4)
        title = wezterm.truncate_left(title, max_width - 2)

        return {
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.background } },
            { Text = (tab.is_active or hover) and symbol_map.left or " " },
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = " " .. title .. " " },
            { Background = { Color = colors.background } },
            { Foreground = { Color = colors.background } },
            { Text = (tab.is_active or hover) and symbol_map.left or " " },
        }
    end
)
