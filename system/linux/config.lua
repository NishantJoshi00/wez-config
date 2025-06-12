local utils = require 'utils'

return function(config)
    -- ===================
    -- DISPLAY BACKEND
    -- ===================
    config.enable_wayland = false
    config.front_end = "WebGpu"
    
    -- ===================
    -- FONT CONFIGURATION
    -- ===================
    config.font_size = 14
    
    -- ===================
    -- WINDOW LAYOUT
    -- ===================
    config.window_padding = {
        left = '1cell',
        right = '1cell',
        top = 0,
        bottom = 0
    }
    config.adjust_window_size_when_changing_font_size = false
    
    -- ===================
    -- INPUT METHOD
    -- ===================
    config.use_ime = false

    return config
end
