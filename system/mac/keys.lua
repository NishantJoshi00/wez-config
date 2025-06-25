local wezterm = require('wezterm');
local action = wezterm.action

local keys = {
    -- ===================
    -- KEY DISABLES
    -- ===================
    {
        key = 'p',
        mods = 'OPT',
        action = wezterm.action.DisableDefaultAssignment
    },

    -- ===================
    -- WINDOW MANAGEMENT
    -- ===================
    {
        key = "f",
        mods = 'CTRL|CMD',
        action = action.ToggleFullScreen,
    },

    -- ===================
    -- TERMINAL CONTROL
    -- ===================
    {
        key = "k",
        mods = "CMD|SHIFT",
        action = action.Multiple {
            action.ClearScrollback 'ScrollbackAndViewport',
            action.SendKey { key = 'L', mods = 'CTRL' },
        },
    },
    {
        key = 'k',
        mods = 'CMD',
        action = action.Multiple {
            action.ClearScrollback 'ScrollbackAndViewport',
            action.SendKey { key = 'L', mods = 'CTRL' },
        },
    },

    -- ===================
    -- TAB MANAGEMENT
    -- ===================
    {
        key = "i",
        mods = 'CMD|SHIFT',
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
        mods = 'CMD|SHIFT',
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

    -- ===================
    -- PANE SPLITTING
    -- ===================
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

    -- ===================
    -- PANE NAVIGATION
    -- ===================
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
    {
        key = "j",
        mods = "CMD",
        action = wezterm.action.TogglePaneZoomState
    }
}

return keys
