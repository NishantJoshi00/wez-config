# WezTerm Configuration Keybindings

This document provides a comprehensive reference for all keyboard shortcuts available in this WezTerm configuration.

## Platform Differences

- **macOS**: Uses `CMD` (⌘) key as primary modifier
- **Linux**: Uses `META` (Alt/Super) key as primary modifier

The key combinations below show the macOS version. For Linux, replace `CMD` with `META`.

## Keybinding Reference

### Window Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Ctrl+CMD+F` | Toggle Fullscreen | Enter/exit fullscreen mode |

### Terminal Control

| Keybinding | Action | Description |
|------------|--------|-------------|
| `CMD+K` | Clear Scrollback | Clear the scrollback buffer |
| `CMD+Shift+K` | Clear + Reset | Clear scrollback and send Ctrl+L to reset terminal |

### Tab Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `CMD+Shift+I` | Rename Tab | Prompt to enter a new name for the current tab |

### Interface Actions

| Keybinding | Action | Description |
|------------|--------|-------------|
| `CMD+Shift+P` | Command Palette | Open WezTerm's command palette |
| `Ctrl+CMD+;` | Copy Mode | Enter copy/selection mode |
| `CMD+Shift+F` | Quick Select | Quick select mode for URLs, paths, etc. |

### Pane Management

#### Pane Splitting

| Keybinding | Action | Description |
|------------|--------|-------------|
| `CMD+Shift+J` | Split Down | Split current pane horizontally (new pane below) |
| `CMD+Shift+L` | Split Right | Split current pane vertically (new pane to the right) |
| `CMD+Shift+H` | Split Left | Split current pane vertically (new pane to the left) |
| `CMD+Shift+K` | Split Up | Split current pane horizontally (new pane above) |

#### Pane Navigation

| Keybinding | Action | Description |
|------------|--------|-------------|
| `CMD+H` | Previous Pane | Navigate to the previous pane |
| `CMD+L` | Next Pane | Navigate to the next pane |

### Key Disables

| Keybinding | Action | Description |
|------------|--------|-------------|
| `OPT+P` (macOS) / `META+P` (Linux) | Disabled | Prevents accidental triggering of system shortcuts |

## Quick Select Patterns

The configuration includes custom quick select patterns for common development tasks:

- **File paths with line numbers**: `filename.ext:123:45`
- **Email addresses**: `user@domain.com`

Use `CMD+Shift+F` (or `META+Shift+F` on Linux) to activate quick select mode.

## Platform-Specific Notes

### macOS
- Uses native macOS fullscreen mode
- CMD key bindings follow macOS conventions
- IME (Input Method Editor) is disabled for performance

### Linux
- META key typically maps to Alt or Super key
- Wayland support is disabled for compatibility
- Uses WebGpu backend for optimal performance

## Customization

### Adding New Keybindings

1. **Cross-platform bindings**: Add to `global/keys.lua`
2. **Platform-specific bindings**: Add to `system/mac/keys.lua` or `system/linux/keys.lua`
3. **Merge with existing**: Use `utils.join(config.keys, new_keys)` pattern

### Key Binding Format

```lua
{
    key = "k",
    mods = "CMD|SHIFT",
    action = wezterm.action.SomeAction
}
```

### Available Modifiers

- `CMD` - Command key (macOS) / Meta key (Linux when using CMD in config)
- `META` - Meta/Alt key
- `CTRL` - Control key
- `SHIFT` - Shift key
- `OPT` - Option key (macOS) / Alt key (Linux)

Combine modifiers with `|` (pipe character).

## Troubleshooting

### Keybindings Not Working

1. **Check for conflicts**: Ensure your desktop environment or system doesn't capture the same shortcuts
2. **Verify modifiers**: Confirm you're using the correct modifier key for your platform
3. **Test in isolation**: Try the keybinding in a fresh WezTerm instance
4. **Check logs**: Look for any error messages in WezTerm's debug output

### Linux-Specific Issues

- **META key not working**: Check your desktop environment's keyboard settings
- **Super key conflicts**: Some DEs capture Super+key combinations for system shortcuts
- **Alt key behavior**: Ensure Alt key isn't being interpreted as Option by applications

### macOS-Specific Issues

- **CMD key conflicts**: Check System Preferences > Keyboard > Shortcuts for conflicts
- **Mission Control**: Some shortcuts may conflict with macOS Mission Control
- **App-specific shortcuts**: Individual applications may override global shortcuts

## Contributing New Keybindings

When adding new keybindings:

1. **Follow existing patterns** for consistency
2. **Test on both platforms** if possible
3. **Document the purpose** clearly
4. **Avoid common system shortcuts** to prevent conflicts
5. **Use descriptive action names**

See [CONTRIBUTING.md](../CONTRIBUTING.md) for detailed contribution guidelines.