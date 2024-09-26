local utils = require 'utils'

return function(config)
  config.enable_wayland = false
  config.font_size = 12

  config.dpi = 196.0

  return config
end
