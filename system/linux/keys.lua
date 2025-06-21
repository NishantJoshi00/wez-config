local wezterm = require('wezterm');
local action = wezterm.action

local keys = {
    -- ===================
    -- KEY DISABLES
    -- ===================
    {
        key = 'p',
        mods = 'META',
        action = wezterm.action.DisableDefaultAssignment
    },

    -- ===================
    -- WINDOW MANAGEMENT
    -- ===================
    {
        key = "f",
        mods = 'CTRL|META',
        action = action.ToggleFullScreen,
    },

    -- ===================
    -- TERMINAL CONTROL
    -- ===================
    {
        key = "k",
        mods = "META|SHIFT",
        action = action.Multiple {
            action.ClearScrollback 'ScrollbackAndViewport',
            action.SendKey { key = 'L', mods = 'CTRL' },
        },
    },
    {
        key = "k",
        mods = "META",
        action = action.ClearScrollback 'ScrollbackAndViewport',
    },

    -- ===================
    -- TAB MANAGEMENT
    -- ===================
    {
        key = "i",
        mods = 'META|SHIFT',
        action = action.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }
    },

    -- ===================
    -- INTERFACE ACTIONS
    -- ===================
    {
        key = 'p',
        mods = 'META|SHIFT',
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = ';',
        mods = 'CTRL|META',
        action = wezterm.action.ActivateCopyMode
    },
    {
        key = 'f',
        mods = 'META|SHIFT',
        action = wezterm.action.QuickSelect
    },

    -- ===================
    -- PANE SPLITTING
    -- ===================
    {
        key = "j",
        mods = "META|SHIFT",
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
        mods = "META|SHIFT",
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
        mods = "META|SHIFT",
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
        mods = "META|SHIFT",
        action = action.SplitPane {
            direction = 'Up',
            size = { Percent = 50 },
            command = {
                domain = "CurrentPaneDomain",
            },
        }
    },

    -- ===================
    -- PANE NAVIGATION
    -- ===================
    {
        key = "h",
        mods = "META",
        action = wezterm.action.ActivatePaneDirection "Prev"
    },
    {
        key = "l",
        mods = "META",
        action = wezterm.action.ActivatePaneDirection "Next"
    },
}

return keys
