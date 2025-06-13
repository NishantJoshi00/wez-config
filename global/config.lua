local wezterm = require "wezterm"
local colors = require "themes.colors"

return function(config)
    -- ===================
    -- FONT CONFIGURATION
    -- ===================

    config.font = wezterm.font_with_fallback {
        { family = "JetBrains Mono",     weight = "Regular" },
        { family = "Monaspace Neon Var", weight = "Medium" },
        { family = "Intel One Mono",     weight = "Regular" },
        { family = "Geist Mono",         weight = "Medium" },
    }

    -- ===================
    -- APPEARANCE & VISUAL
    -- ===================
    config.window_decorations = "RESIZE"
    config.default_cursor_style = "SteadyBar"
    config.window_background_opacity = 0.9
    config.colors = colors

    -- ===================
    -- TAB BAR SETTINGS
    -- ===================
    config.tab_bar_at_bottom = false
    config.enable_tab_bar = true
    config.use_fancy_tab_bar = false
    config.show_new_tab_button_in_tab_bar = false

    -- ===================
    -- WINDOW LAYOUT
    -- ===================
    config.window_padding = {
        top = 0,
        left = 0,
        bottom = 0,
        right = 0,
    }

    -- ===================
    -- PERFORMANCE
    -- ===================
    config.max_fps = 75

    -- ===================
    -- COMMAND PALETTE
    -- ===================
    config.command_palette_bg_color = colors.background
    config.command_palette_fg_color = colors.foreground
    config.command_palette_font_size = 14.0
    config.command_palette_rows = 10

    -- ===================
    -- AUDIO & NOTIFICATIONS
    -- ===================
    config.audible_bell = "Disabled"

    -- ===================
    -- TEXT SELECTION & SEARCH
    -- ===================
    config.quick_select_patterns = {
        "[\\w./]+:\\d+:\\d+", -- filename with line:col
        "[\\w.-]+@[\\w.-]+",  -- email addresses
    }

    return config
end
