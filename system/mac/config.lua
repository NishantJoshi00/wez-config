-- local wezterm = require 'wezterm'

local utils = require 'utils'

return function(config)
  -- ===================
  -- MACOS PLATFORM FEATURES
  -- ===================
  config.native_macos_fullscreen_mode = true
  
  -- ===================
  -- FONT CONFIGURATION
  -- ===================
  config.font_size = 14
  
  -- ===================
  -- WINDOW SETTINGS
  -- ===================
  config.initial_cols = 128
  
  -- ===================
  -- INPUT METHOD
  -- ===================
  config.use_ime = false

  return config
end
