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
- `keys.lua` - Cross-platform keybindings  
- `hooks.lua` - Event handlers for tab formatting and UI customization

**Platform Layer** (`system/mac/` or `system/linux/`):
- Platform-specific overrides for display settings, font sizes, and key modifiers
- macOS uses CMD-based shortcuts, Linux uses OPT-based shortcuts

### Loader System (`loader.lua`)

Uses a helper function pattern that:
1. Loads hooks first to register event handlers
2. Applies configuration transformations
3. Merges keys using `utils.join()` for additive configuration

Each configuration module returns a **transformer function** that takes a config object and returns the modified config.

## File Organization Patterns

- **Separation of Concerns**: Each aspect (config, keys, hooks) is in separate files
- **Platform Abstraction**: Differences between macOS/Linux are cleanly separated
- **Utility-First**: Common functions in `utils.lua` (table merging, tab titles, icon mapping)
- **Theme Management**: `themes/colors.lua` acts as theme selector, supports both Lua and TOML formats

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

### Theme System

- Theme selection in `themes/colors.lua`
- Individual themes in separate files (`kanagawa-dragon.lua`)
- External themes supported via TOML files in `schemes/`

## Platform Detection

The loader automatically detects platform using these mappings:
- `"x86_64-apple-darwin"` and `"aarch64-apple-darwin"` → `system.mac`
- `"x86_64-unknown-linux-gnu"` → `system.linux`
- `"global"` → always loaded first

## Utility Functions

`utils.lua` provides:
- `join(table1, table2)` - Table merging for configuration composition
- `tab_title(tab_info)` - Extract clean tab titles from process info
- `language_map` - File extension to icon mappings for tab styling
- `symbol_map` - UI symbol definitions

## Event System Integration

Uses WezTerm's event hooks for dynamic UI:
- `format-tab-title` - Custom tab rendering with language icons
- Hook registration happens before config loading to ensure proper event handling
