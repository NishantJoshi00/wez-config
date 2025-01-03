local utils = require 'utils'

return function(config)
    config.tab_bar_at_bottom = false
    config.enable_wayland = false
    config.font_size = 12

    config.window_padding = {
        left = '1cell',
        right = '1cell',
        top = 0,
        bottom = 0
    }

    config.front_end = "OpenGL"
    config.use_ime = false

    return config
end
