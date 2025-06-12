local wezterm = require "wezterm"
local colors = require "themes.colors"

return function(config)
    -- Font Configuration
    config.font = wezterm.font_with_fallback {
        { family = "JetBrains Mono", weight = "Medium" },
        { family = "Geist Mono",              weight = "Medium" },
        { family = "Intel One Mono",          weight = "Regular" },
        { family = "Monaspace Neon Var",      weight = "Medium" },
    }

    -- Window Appearance
    config.window_decorations = "RESIZE"
    config.default_cursor_style = "SteadyBar"
    config.window_background_opacity = 0.9

    -- Tab Bar Configuration
    config.tab_bar_at_bottom = false
    config.enable_tab_bar = true
    config.use_fancy_tab_bar = false
    config.show_new_tab_button_in_tab_bar = false

    -- Theme and Colors
    config.colors = colors

    -- Audio and Notifications
    config.audible_bell = "Disabled"

    -- Performance Settings
    config.max_fps = 75

    -- Window Layout
    config.window_padding = {
        top = 0,
        left = 0,
        bottom = 0,
        right = 0,
    }

    -- Text Selection and Search
    config.quick_select_patterns = {
        -- filename
        "[\\w./]+:\\d+:\\d+",
        "[\\w.-]+@[\\w.-]+",

    }

    return config
end
