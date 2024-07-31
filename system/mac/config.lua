local wezterm = require 'wezterm'
local utils = require 'utils'

return function(config)
  config.keys = utils.join(config.keys, require("system.mac.keys"))

  return config
end
