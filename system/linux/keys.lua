local wezterm = require('wezterm');
local action = wezterm.action

return {
    {
        key = "l",
        mods = 'OPT',
        action = action.SplitHorizontal {
            domain = "CurrentPaneDomain"
        }
    },
    {
        key = "k",
        mods = "OPT",
        action = action.ClearScrollback 'ScrollbackAndViewport',
    },

    -- create directioanl splits
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
