local wezterm = require('wezterm');
local action = wezterm.action

local keys = {
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
    key = "j",
    mods = 'CMD',
    action = action.SplitVertical {
      domain = "CurrentPaneDomain"
    }
  },
  {
    key = "l",
    mods = 'CMD',
    action = action.SplitHorizontal {
      domain = "CurrentPaneDomain"
    }
  },
  {
    key = 'p',
    mods = 'CMD',
    action = wezterm.action.ActivateCommandPalette,
  },
}



return keys
