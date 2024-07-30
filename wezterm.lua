local wezterm = require 'wezterm'
local config = {};

if wezterm.config_builder then
  config = wezterm.config_builder()
end

require "hooks"

config = require("global.config")(config)

local branches = {
  ["x86_64-unknown-linux-gnu"] = require("system.linux.config"),
  ["x86_64-apple-darwin"] = require("system.mac.config"),
  ["aarch64-apple-darwin"] = require("system.mac.config"),
}

config = branches[wezterm.target_triple](config)

return config
