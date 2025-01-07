local utils = require 'utils'

return function(config)
    config.tab_bar_at_bottom = false
    config.enable_wayland = false
    config.font_size = 14

    config.window_padding = {
        left = '1cell',
        right = '1cell',
        top = 0,
        bottom = 0
    }
    config.adjust_window_size_when_changing_font_size = false
    config.front_end = "WebGpu"
    config.use_ime = false

    return config
end
