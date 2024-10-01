local utils = require 'utils'

return function(config)
  config.enable_wayland = false
  config.font_size = 12

  -- config.dpi = 192.0

  config.front_end = "OpenGL"

  return config
end
