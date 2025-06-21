# Changelog

All notable changes to this WezTerm configuration will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-12-21

### Added
- **Initial public release** 🚀
- **Modular architecture** with platform-aware configuration loading
- **Cross-platform support** for macOS and Linux with Windows fallback
- **Comprehensive keybindings** for pane management and navigation
- **Beautiful theming** with Kanagawa Dragon color scheme
- **Smart tab styling** with programming language icons
- **Platform-specific optimizations**:
  - macOS: CMD-based shortcuts, native fullscreen, optimized font sizing
  - Linux: META-based shortcuts, WebGpu backend, Wayland compatibility
- **Font fallback system** (JetBrains Mono → Iosevka → CommitMono → Geist Mono)
- **Performance optimizations** (75 FPS limit, disabled fancy tab bar)
- **AI integration support** with optional Gemini API script
- **Comprehensive documentation**:
  - Complete setup guide with troubleshooting
  - Detailed keybindings reference
  - Architecture overview
  - Contributing guidelines
- **Security features**:
  - Proper secrets management with gitignored configuration
  - Template file for safe API key setup

### Configuration Details
- **Window settings**: 90% opacity, borderless with resize capability
- **Font configuration**: 14pt font size on both platforms
- **Tab management**: Custom tab titles with language detection
- **Quick select**: File paths and email pattern recognition
- **Error handling**: Graceful fallbacks for missing dependencies

### Development Features
- **Modular loader system** with automatic platform detection
- **Utility functions** for configuration composition
- **Event system integration** for dynamic UI updates
- **Extensible theme system** with easy customization
- **Production-ready** with MIT license and contribution guidelines

## [Unreleased]

### Planned
- Additional color schemes (Gruvbox, Nord, etc.)
- Windows-specific optimizations
- Time-based theme switching
- Configuration validation and migration tools
- Package manager distribution (Homebrew, AUR)

---

## Version History

- **v1.0.0**: Initial public release with full feature set
- **Pre-1.0**: Development and testing phase

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for information on how to contribute to this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.