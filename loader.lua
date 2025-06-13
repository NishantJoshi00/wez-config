local utils = require "utils"

--- Lazy load the configuration for the current system
--- @param relative_path string
--- @return fun(config: table): table
local helper = function(relative_path)
  return function(config)
    require(relative_path .. ".hooks")
    config = require(relative_path .. ".config")(config)
    config.keys = utils.join(config.keys, require(relative_path .. ".keys"))
    return config
  end
end

local loader = {
  ["global"] = helper("global"),
  ["x86_64-unknown-linux-gnu"] = helper("system.linux"),
  ["aarch64-unknown-linux-gnu"] = helper("system.linux"), -- ARM Linux uses same config as x86_64 Linux
  ["x86_64-apple-darwin"] = helper("system.mac"),
  ["aarch64-apple-darwin"] = helper("system.mac")
}

-- Add fallback for unsupported platforms (mainly Windows)
setmetatable(loader, {
  __index = function(t, platform)
    if platform and platform:match("windows") then
      print("WARNING: Windows platform detected but not fully supported. Using global config only.")
      return helper("global")
    end
    print("WARNING: Unknown platform '" .. tostring(platform) .. "'. Using global config only.")
    return helper("global")
  end
})


return loader
