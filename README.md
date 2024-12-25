# WezTerm Config

A modern, feature-rich WezTerm configuration with system-specific settings, custom themes, and extensive keyboard shortcuts.

## Description

This configuration provides a carefully crafted setup for WezTerm terminal emulator with:

- System-specific configurations for Linux and macOS
- Dynamic theme switching based on time of day
- Custom tab styling with icons for different programming languages
- Extensive keyboard shortcuts optimized for development
- Smart layout management and split panes
- Wayland support configuration for Linux

## Installation

1. Backup your existing WezTerm configuration if present:

   ```bash
   cp -r ~/.config/wezterm ~/.config/wezterm.backup
   ```

2. Clone this repository to your WezTerm configuration directory:

   ```bash
   git clone https://github.com/yourusername/wezterm-config ~/.config/wezterm
   ```

3. Ensure you have the required fonts installed:
   - Geist Mono
   - SFMono Nerd Font
   - Monaspace Neon Var

## Usage

The configuration will automatically load the appropriate settings based on your operating system. Key features include:

1. Theme switching:

   - Light theme (oldworld) during daytime (6:00-19:00)
   - Dark theme (kanagawa-dragon) during nighttime

2. System-specific settings:

   - **macOS**: 16pt font size, native fullscreen support
   - **Linux**: 12pt font size, OpenGL frontend

3. General settings:
   - Semi-transparent background (90% opacity)
   - Custom tab bar styling
   - 75 FPS limit
   - Zero-padding window layout

## Configuration Options

### Global Settings

- **Font Configuration**: Multi-font fallback system with Geist Mono as primary
- **Window Settings**:
  - Borderless window with resize capability
  - Custom padding and opacity
  - Fancy tab bar disabled for performance
- **Performance**: 75 FPS cap for optimal resource usage

### Themes

The configuration includes three themes:

- Kanagawa Dragon (Dark)
- Oldworld (Light)
- Catppuccin Mocha (Alternative)
