local utils = require 'utils'

return function(config)
  config.enable_wayland = false
  config.keys = utils.join(config.keys, require("system.linux.keys"))
  config.font_size = 12

  config.front_end = "OpenGL"

  return config
end
