local wezterm = require "wezterm"
local colors = require "themes.colors"

return function(config)
    config.font = wezterm.font_with_fallback {
        { family = "JetBrainsMono Nerd Font", weight = "Medium" },
        { family = "Intel One Mono",          weight = "Regular" },
        { family = "Geist Mono",              weight = "Medium" },
        { family = "Monaspace Neon Var",      weight = "Medium" },
    }

    config.window_decorations = "RESIZE"
    config.default_cursor_style = "SteadyBar"
    config.window_background_opacity = 0.9

    config.colors = colors

    config.enable_tab_bar = true
    config.use_fancy_tab_bar = false
    config.show_new_tab_button_in_tab_bar = false
    config.audible_bell = "Disabled"

    config.max_fps = 75

    config.window_padding = {
        top = 0,
        left = 0,
        bottom = 0,
        right = 0,
    }

    config.quick_select_patterns = {
        -- filename
        "[\\w./]+:\\d+:\\d+"
    }

    return config
end
