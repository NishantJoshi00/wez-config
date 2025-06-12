local utils = require 'utils'

return function(config)
    -- Display Backend Configuration
    config.enable_wayland = false
    config.front_end = "WebGpu"
    
    -- Font Configuration
    config.font_size = 14
    
    -- Window Layout
    config.window_padding = {
        left = '1cell',
        right = '1cell',
        top = 0,
        bottom = 0
    }
    config.adjust_window_size_when_changing_font_size = false
    
    -- Input Method Settings
    config.use_ime = false

    return config
end
