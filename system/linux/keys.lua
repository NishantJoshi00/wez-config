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
        mods = 'CTRL|OPT',
        action = action.ToggleFullScreen,
    },
    -- ===================
    -- TERMINAL CONTROL
    -- ===================
    {
        key = "k",
        mods = "OPT|SHIFT",
        action = action.Multiple {
            action.ClearScrollback 'ScrollbackAndViewport',
            action.SendKey { key = 'L', mods = 'CTRL' },
        },
    },
    {
        key = "k",
        mods = "OPT",
        action = action.ClearScrollback 'ScrollbackAndViewport',
    },

    -- ===================
    -- TAB MANAGEMENT
    -- ===================
    {
        key = "i",
        mods = 'OPT|SHIFT',
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
        mods = 'OPT|SHIFT',
        action = wezterm.action.ActivateCommandPalette,
    },
    {
        key = ';',
        mods = 'CTRL|OPT',
        action = wezterm.action.ActivateCopyMode
    },
    {
        key = 'f',
        mods = 'OPT|SHIFT',
        action = wezterm.action.QuickSelect
    },

    -- ===================
    -- PANE SPLITTING
    -- ===================
    {
        key = "j",
        mods = "OPT|SHIFT",
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
        mods = "OPT|SHIFT",
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
        mods = "OPT|SHIFT",
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
        mods = "OPT|SHIFT",
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
        mods = "OPT",
        action = wezterm.action.ActivatePaneDirection "Prev"
    },
    {
        key = "l",
        mods = "OPT",
        action = wezterm.action.ActivatePaneDirection "Next"
    },
}

return keys
