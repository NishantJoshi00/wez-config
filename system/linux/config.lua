local utils = require 'utils'

return function(config)
    config.enable_wayland = false
    config.font_size = 14

    config.front_end = "OpenGL"

    return config
end
