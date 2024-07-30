local wezterm = require('wezterm');

local keys = require('keys')


local config = {};



if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font_with_fallback {
  { family = "SFMono Nerd Font",   weight = "Medium" },
  { family = "Geist Mono",         weight = "Medium" },
  { family = "Monaspace Neon Var", weight = "Medium" },
}

config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingBlock"
config.window_background_opacity = 0.9
config.cursor_blink_rate = 8
config.initial_cols = 120
config.font_size = 14

config.keys = keys

config.colors = require("colors")


config.enable_tab_bar = true
config.use_fancy_tab_bar = false


require("tab_bar")


config.window_padding = {
  top = 0,
  left = 0,
  bottom = 0,
  right = 0,
}

config.use_ime = false



return config
