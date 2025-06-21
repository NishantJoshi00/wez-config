# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This WezTerm configuration uses a **modular, platform-aware architecture** with a sophisticated loader system that automatically detects the platform and applies appropriate configurations.

### Core Loading Pattern

The entry point (`wezterm.lua`) uses a two-stage loading process:
1. Load global configuration (applies to all platforms)
2. Load platform-specific overrides based on `wezterm.target_triple`

```lua
config = require("loader")["global"](config)
config = require("loader")[wezterm.target_triple](config)
```

### Configuration Layers

**Global Layer** (`global/`):
- `config.lua` - Base visual settings, fonts, window properties
- `keys.lua` - Cross-platform keybindings (currently empty)
- `hooks.lua` - Event handlers for tab formatting and UI customization

**Platform Layer** (`system/mac/` or `system/linux/`):
- Platform-specific overrides for display settings, font sizes, and key modifiers
- macOS uses CMD-based shortcuts, Linux uses OPT-based shortcuts
- macOS: 14pt font, native fullscreen, 128 columns
- Linux: 14pt font, WebGpu frontend, Wayland disabled, cell-based padding

### Loader System (`loader.lua`)

Uses a helper function pattern that:
1. Loads hooks first to register event handlers
2. Applies configuration transformations
3. Merges keys using `utils.join()` for additive configuration

Each configuration module returns a **transformer function** that takes a config object and returns the modified config. The loader includes fallback support for Windows and unknown platforms.

## File Organization Patterns

- **Separation of Concerns**: Each aspect (config, keys, hooks) is in separate files
- **Platform Abstraction**: Differences between macOS/Linux are cleanly separated
- **Utility-First**: Common functions in `utils.lua` (table merging, tab titles, icon mapping)
- **Theme Management**: `themes/colors.lua` acts as theme selector, currently hardcoded to kanagawa-dragon
- **Scripts**: External utilities in `scripts/` directory (e.g., AI-powered tab naming)

## Development Patterns

### Adding New Configuration

1. **Cross-platform features**: Add to `global/` directory
2. **Platform-specific features**: Add to appropriate `system/{platform}/` directory  
3. **New keybindings**: Use `utils.join()` to merge with existing keys
4. **UI customization**: Use WezTerm's event system in hooks files

### Configuration Structure

Each config file follows this pattern:
```lua
return function(config)
    -- Apply settings to config object
    config.setting = value
    return config
end
```

### Key Binding Conventions

- Use declarative key binding objects with `key`, `mods`, and `action` properties
- Platform differences handled through different modifier keys (CMD vs OPT)
- Keys are merged additively using `utils.join(config.keys, new_keys)`
- Extensive macOS shortcuts in `system/mac/keys.lua` for window, tab, and pane management

### Theme System

- Theme selection in `themes/colors.lua`
- Individual themes in `themes/collection/` directory (`kanagawa-dragon.lua`)
- Time-based theme switching infrastructure present but not currently used

## Platform Detection

The loader automatically detects platform using these mappings:
- `"x86_64-apple-darwin"` and `"aarch64-apple-darwin"` → `system.mac`
- `"x86_64-unknown-linux-gnu"` and `"aarch64-unknown-linux-gnu"` → `system.linux`
- `"global"` → always loaded first
- Windows and unknown platforms fall back to global config only

## Utility Functions

`utils.lua` provides:
- `join(table1, table2)` - Table merging for configuration composition
- `tab_title(tab_info)` - Extract clean tab titles from process info
- `language_map` - File extension to icon mappings for tab styling (supports 15+ languages)
- `symbol_map` - UI symbol definitions
- `secrets` - Optional secrets loading with error handling

## Event System Integration

Uses WezTerm's event hooks for dynamic UI:
- `format-tab-title` - Custom tab rendering with language icons
- Hook registration happens before config loading to ensure proper event handling

## Key Bindings Summary

### macOS Key Bindings (`system/mac/keys.lua`)
- **Window Management**: `Ctrl+Cmd+F` (fullscreen)
- **Terminal Control**: `Cmd+K` (clear scrollback), `Cmd+Shift+K` (clear + reset)
- **Tab Management**: `Cmd+Shift+I` (rename tab)
- **Interface**: `Cmd+Shift+P` (command palette), `Ctrl+Cmd+;` (copy mode), `Cmd+Shift+F` (quick select)
- **Pane Splitting**: `Cmd+Shift+J/L/H/K` (split down/right/left/up)
- **Pane Navigation**: `Cmd+H/L` (previous/next pane)

### Configuration Highlights
- Font fallback: JetBrains Mono → Iosevka → CommitMono → Geist Mono
- 90% background opacity, 75 FPS limit
- Quick select patterns for file paths and email addresses
- Disabled audible bell, fancy tab bar, and IME input
