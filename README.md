# WezTerm Configuration

A modern, production-ready WezTerm configuration with platform-aware settings, custom themes, and extensive keyboard shortcuts.

## Features

- **🖥️ Platform-Specific Configurations**: Optimized settings for macOS and Linux
- **🎨 Beautiful Themes**: Kanagawa Dragon theme with custom tab styling
- **⌨️ Comprehensive Keybindings**: Intuitive shortcuts for pane management and navigation
- **🔧 Modular Architecture**: Easy to customize and extend
- **📱 Language Icons**: Smart tab titles with programming language detection
- **⚡ Performance Optimized**: 75 FPS limit and efficient rendering

## Quick Start

### Prerequisites

Install WezTerm:
- **macOS**: `brew install wezterm`
- **Linux**: [Download from GitHub releases](https://github.com/wez/wezterm/releases)

### Installation

1. **Backup existing configuration** (if any):
   ```bash
   mv ~/.config/wezterm ~/.config/wezterm.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone https://github.com/NishantJoshi00/wez-config ~/.config/wezterm
   ```

3. **Install recommended fonts**:
   - [JetBrains Mono](https://github.com/JetBrains/JetBrainsMono) (primary)
   - [Iosevka](https://github.com/be5invis/Iosevka) (fallback)
   - [CommitMono](https://github.com/eigilnikolajsen/commit-mono) (fallback)
   - [Geist Mono](https://github.com/vercel/geist-font) (fallback)

4. **Launch WezTerm** - the configuration will auto-detect your platform and apply appropriate settings.

## Platform-Specific Features

### macOS
- **Font Size**: 14pt
- **Keybindings**: CMD-based shortcuts (familiar to macOS users)
- **Window**: Native fullscreen support, 128 columns
- **Features**: IME disabled for performance

### Linux
- **Font Size**: 14pt  
- **Keybindings**: META (Alt/Super) key shortcuts
- **Backend**: WebGpu with Wayland disabled for compatibility
- **Window**: Cell-based padding, resize-optimized

## Key Bindings

This configuration provides extensive keyboard shortcuts for efficient terminal management. See the complete [Keybindings Reference](docs/keybindings.md) for detailed documentation.

### Quick Reference

| Function | macOS | Linux | Description |
|----------|-------|-------|-------------|
| Toggle fullscreen | `Ctrl+Cmd+F` | `Ctrl+Meta+F` | Enter/exit fullscreen |
| Clear scrollback | `Cmd+K` | `Meta+K` | Clear terminal history |
| Command palette | `Cmd+Shift+P` | `Meta+Shift+P` | Open command palette |
| Split pane right | `Cmd+Shift+L` | `Meta+Shift+L` | Create vertical split |
| Split pane down | `Cmd+Shift+J` | `Meta+Shift+J` | Create horizontal split |
| Navigate panes | `Cmd+H/L` | `Meta+H/L` | Switch between panes |

**📖 For complete keybindings documentation, see [docs/keybindings.md](docs/keybindings.md)**

## Customization

### Adding Themes
1. Create a new theme file in `themes/collection/`
2. Update `themes/colors.lua` to include your theme
3. Set it as the default or add time-based switching

### Platform-Specific Settings
- **Global settings**: Edit files in `global/`
- **Platform overrides**: Edit files in `system/mac/` or `system/linux/`

### External Scripts
The configuration supports optional external scripts:
- **AI Tab Naming**: `scripts/ai-gemini.sh` (requires `GEMINI_API_KEY`)

To use scripts, create a `secrets.lua` file:
```lua
local secrets = {
    llama_api_key = "your-llama-api-key-here"
}
return secrets
```

## Architecture

This configuration uses a modular, platform-aware architecture:

```
wezterm.lua          # Entry point
├── loader.lua       # Platform detection and loading logic
├── global/          # Cross-platform settings
│   ├── config.lua   # Base visual settings
│   ├── keys.lua     # Global keybindings
│   └── hooks.lua    # Event handlers
├── system/          # Platform-specific overrides
│   ├── mac/         # macOS-specific settings
│   └── linux/       # Linux-specific settings
├── themes/          # Theme management
├── utils.lua        # Utility functions
└── scripts/         # External utilities
```

## Troubleshooting

### Fonts Not Displaying Correctly
Ensure all fallback fonts are installed. The configuration will gracefully degrade to available fonts.

### Key Bindings Not Working
- **Linux**: Ensure your desktop environment doesn't capture META key shortcuts
- **macOS**: Check System Preferences for conflicting shortcuts

### Performance Issues
- Reduce `max_fps` in `global/config.lua`
- Disable transparency by setting `window_background_opacity = 1.0`

### Script Issues
- **AI Scripts**: Verify API keys are set in `secrets.lua` (note: `llama_api_key` is for Llama, while `scripts/ai-gemini.sh` requires `GEMINI_API_KEY`)
- **Permissions**: Ensure scripts in `scripts/` directory are executable

## Contributing

1. Fork the repository
2. Create a feature branch
3. Test on both macOS and Linux if possible
4. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- WezTerm team for the excellent terminal emulator
- Kanagawa colorscheme by rebelot
- Nerd Fonts for icon support
