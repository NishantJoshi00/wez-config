local wezterm = require('wezterm');
local action = wezterm.action

local keys = {
    {
        key = 'p',
        mods = 'OPT',
        action = wezterm.action.DisableDefaultAssignment
    },
    {
        key = "f",
        mods = 'CTRL|CMD',
        action = action.ToggleFullScreen,
    },
    {
        key = "k",
        mods = "CMD|SHIFT",
        action = action.Multiple {
            action.ClearScrollback 'ScrollbackAndViewport',
            action.SendKey { key = 'L', mods = 'CTRL' },
        },
    },
    {
        key = "k",
        mods = "CMD",
        action = action.ClearScrollback 'ScrollbackAndViewport',
    },
    {
        key = "i",
        mods = 'CMD|SHIFT',
        action = action.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                -- line will be `nil` if they hit escape without entering anything
                -- An empty string if they just hit enter
                -- Or the actual line of text they wrote
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }
    },
    {
        key = 'p',
        mods = 'CMD',
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = ';',
        mods = 'CTRL|CMD',
        action = wezterm.action.ActivateCopyMode
    },
    {
        key = 'f',
        mods = 'CMD|SHIFT',
        action = wezterm.action.QuickSelect
    },

    -- create directioanl splits
    {
        key = "j",
        mods = "CMD|SHIFT",
        action = action.SplitPane {
            direction = 'Down',
            size = { Percent = 50 },
            command = {
                domain = "CurrentPaneDomain",
            },
        }
    },
    {
        key = "l",
        mods = "CMD|SHIFT",
        action = action.SplitPane {
            direction = 'Right',
            size = { Percent = 50 },
            command = {
                domain = "CurrentPaneDomain",
            },
        }
    },
    {
        key = "h",
        mods = "CMD|SHIFT",
        action = action.SplitPane {
            direction = 'Left',
            size = { Percent = 50 },
            command = {
                domain = "CurrentPaneDomain",
            },
        }
    },
    {
        key = "k",
        mods = "CMD|SHIFT",
        action = action.SplitPane {
            direction = 'Up',
            size = { Percent = 50 },
            command = {
                domain = "CurrentPaneDomain",
            },
        }
    },

    -- change context
    {
        key = "h",
        mods = "CMD",
        action = wezterm.action.ActivatePaneDirection "Prev"
    },
    {
        key = "l",
        mods = "CMD",
        action = wezterm.action.ActivatePaneDirection "Next"
    },
}



return keys
