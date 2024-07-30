local wezterm = require("wezterm")
local colors = require("oldworld")

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

local symbol_map = {
  left = '',
  right = ''
}

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = colors.bg
    local background = colors.bg_dark
    local foreground = colors.fg

    if tab.is_active then
      background = colors.fg
      foreground = colors.bg
    elseif hover then
      background = colors.bg
      foreground = colors.fg
    end

    local edge_foreground = background

    local title = tab_title(tab)

    title = wezterm.truncate_right(title, max_width - 2)
    title = wezterm.truncate_left(title, max_width - 2)

    return {
      { Background = { Color = colors.bg_dark } },
      { Foreground = { Color = colors.fg } },
      { Text = (tab.tab_id == tabs[1].tab_id) and #tabs .. " " or "" },
      { Background = { Color = edge_foreground } },
      { Foreground = { Color = edge_background } },
      { Text = (tab.is_active or hover) and symbol_map.left or " " },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = " " .. title .. " " },
      { Background = { Color = colors.bg_dark } },
      { Foreground = { Color = colors.fg } },
      { Text = (tab.is_active or hover) and symbol_map.left or " " },
    }
  end
)


local language_map = {
  ["lua"] = {
    icon = wezterm.nerdfonts.seti_lua,
    name = "Lua"
  },
  ["rs"] = {
    icon = wezterm.nerdfonts.seti_rust,
    name = "Rust"
  },
  ["sh"] = {
    icon = wezterm.nerdfonts.seti_bash,
    name = "Bash"
  },
  ["zsh"] = {
    icon = wezterm.nerdfonts.seti_bash,
    name = "Zsh"
  },
  ["bash"] = {
    icon = wezterm.nerdfonts.seti_bash,
    name = "Bash"
  },
  ["fish"] = {
    icon = wezterm.nerdfonts.seti_fish,
    name = "Fish"
  },
  ["python"] = {
    icon = wezterm.nerdfonts.seti_python,
    name = "Python"
  },
  ["py"] = {
    icon = wezterm.nerdfonts.seti_python,
    name = "Python"
  },
  ["py3"] = {
    icon = wezterm.nerdfonts.seti_python,
    name = "Python"
  },
  ["py2"] = {
    icon = wezterm.nerdfonts.seti_python,
    name = "Python"
  },
  ["python3"] = {
    icon = wezterm.nerdfonts.seti_python,
    name = "Python"
  },
  ["python2"] = {
    icon = wezterm.nerdfonts.seti_python,
    name = "Python"
  },
  ["js"] = {
    icon = wezterm.nerdfonts.seti_javascript,
    name = "JavaScript"
  },
  ["ts"] = {
    icon = wezterm.nerdfonts.seti_typescript,
    name = "TypeScript"
  },
  ["tsx"] = {
    icon = wezterm.nerdfonts.seti_typescript,
    name = "TypeScript"
  },
  ["go"] = {
    icon = wezterm.nerdfonts.seti_go,
    name = "Go"
  },
  ["c"] = {
    icon = wezterm.nerdfonts.seti_c,
    name = "C"
  },
  ["cpp"] = {
    icon = wezterm.nerdfonts.seti_cpp,
    name = "C++"
  },
  ["h"] = {
    icon = wezterm.nerdfonts.seti_c,
    name = "C"
  },
  ["md"] = {
    icon = wezterm.nerdfonts.seti_markdown,
    name = "Markdown"
  },
  ["zig"] = {
    icon = wezterm.nerdfonts.seti_zig,
    name = "Zig"
  }
}

wezterm.on('update-right-status', function(window, pane)
  local title = pane:get_title()

  -- check if title ends with "NVIM"
  if title:sub(-4) == "NVIM" then
    -- split by space and get the first part
    title = title:match("%S+")
    -- split on dot and get the last part
    title = title:match("[^.]+$")
  end

  local language = language_map[title]

  if language then
    title = language.name .. " " .. language.icon
  else
    title = ""
  end

  window:set_left_status(wezterm.nerdfonts.cod_terminal_bash .. " ")
  window:set_right_status(title .. " ")
end)
