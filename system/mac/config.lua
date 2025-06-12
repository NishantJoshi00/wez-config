-- local wezterm = require 'wezterm'

local utils = require 'utils'

return function(config)
  -- macOS Specific Features
  config.native_macos_fullscreen_mode = true
  
  -- Input Method Settings
  config.use_ime = false
  
  -- Window Dimensions
  config.initial_cols = 128
  
  -- Font Configuration
  config.font_size = 14

  return config
end
