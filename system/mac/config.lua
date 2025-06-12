-- local wezterm = require 'wezterm'

local utils = require 'utils'

return function(config)
  config.tab_bar_at_bottom = false
  config.native_macos_fullscreen_mode = true
  config.use_ime = false
  config.initial_cols = 128
  config.font_size = 14

  return config
end
