local colors = {
    foreground = "#c5c9c5",
    background = "#181616",
    cursor_bg = "#c5c9c5",
    cursor_fg = "#181616",
    cursor_border = "#c5c9c5",
    selection_bg = "#223249",
    selection_fg = "#c5c9c5",
    ansi = {
        "#0d0c0c", -- black
        "#c4746e", -- red
        "#8a9a7b", -- green
        "#c4b28a", -- yellow
        "#8ba4b0", -- blue
        "#a292a3", -- magenta
        "#8ea4a2", -- cyan
        "#c8c093", -- white
    },
    brights = {
        "#555555", -- bright black
        "#e46876", -- bright red
        "#87a987", -- bright green
        "#e6c384", -- bright yellow
        "#7fb4ca", -- bright blue
        "#938aa9", -- bright magenta
        "#7aa89f", -- bright cyan
        "#c5c9c5", -- bright white
    },
    tab_bar = {
        background = "#181616",
    },
    activity = {
        busy = "#c4746e",        -- red for running processes
        unseen = "#c4b28a",      -- yellow for unseen output  
        busy_fg = "#181616",     -- dark foreground for busy
        unseen_fg = "#181616",   -- dark foreground for unseen
    }
}

return colors
