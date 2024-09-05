-- local wezterm = require 'wezterm'

local utils = require 'utils'

return function(config)
  config.keys = utils.join(config.keys, require("system.mac.keys"))

  config.tab_bar_at_bottom = false

  config.native_macos_fullscreen_mode = true

  config.initial_cols = 120

  return config
end
