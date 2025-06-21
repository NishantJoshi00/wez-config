# Contributing to WezTerm Configuration

We welcome contributions to this WezTerm configuration! This document outlines the process for contributing and the standards we follow.

## Development Process

### Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/your-username/wez-config
   cd wez-config
   ```
3. **Create a topic branch** for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Making Changes

1. **Test your changes** on both macOS and Linux if possible
2. **Follow the existing code style** and patterns
3. **Update documentation** if you're adding new features
4. **Ensure backward compatibility** unless explicitly breaking changes

### Code Style Guidelines

- Use **4 spaces** for indentation in Lua files
- Follow existing **commenting patterns** for configuration sections
- Keep **platform-specific code** in appropriate `system/` directories
- Use **descriptive variable names** and clear function documentation

### Testing

Before submitting changes:

1. **Test configuration loading** without errors
2. **Verify keybindings work** on target platforms
3. **Check font fallbacks** function correctly
4. **Test with and without optional dependencies** (scripts, fonts)

## Submission Process

### Commit Guidelines

Follow the Linux kernel commit message format:

```
subsystem: brief description of change

Longer explanation of the change, if needed. Wrap at 72 characters.
Include the motivation for the change and contrast with previous
behavior.

Signed-off-by: Your Name <your.email@example.com>
```

Examples:
```
keys: add META+D for duplicate pane functionality

Add META+D keybinding for Linux to match CMD+D behavior on macOS.
This provides consistent pane duplication across platforms.

Signed-off-by: John Doe <john@example.com>
```

```
themes: add gruvbox dark color scheme

Add gruvbox-dark theme to themes/collection/ directory.
Update themes/colors.lua to include new theme option.

Signed-off-by: Jane Smith <jane@example.com>
```

### Pull Request Process

1. **Push your changes** to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create a pull request** against the main branch

3. **Provide a clear description** including:
   - What the change does
   - Why it's needed
   - How it was tested
   - Any breaking changes

4. **Respond to feedback** promptly and update your PR as needed

## Types of Contributions

### Welcome Contributions

- **New themes** (add to `themes/collection/`)
- **Platform-specific optimizations** (Windows, additional Linux distros)
- **Keybinding improvements** (consistent with existing patterns)
- **Documentation improvements**
- **Bug fixes**
- **Performance optimizations**

### Areas Needing Help

- **Windows platform support** (currently fallback only)
- **Additional color schemes** (light themes, popular schemes)
- **Script improvements** (error handling, additional AI providers)
- **Testing on different distributions**
- **Accessibility improvements**

## Architecture Guidelines

### File Organization

- **Global settings**: Place in `global/` directory
- **Platform-specific**: Use `system/mac/` or `system/linux/`
- **Themes**: Add to `themes/collection/`
- **Utilities**: Extend `utils.lua` for shared functions
- **Scripts**: Add to `scripts/` with proper error handling

### Configuration Pattern

All config files should follow this pattern:
```lua
return function(config)
    -- Apply settings to config object
    config.setting = value
    return config
end
```

### Key Binding Conventions

- **macOS**: Use `CMD` modifier
- **Linux**: Use `META` modifier
- **Cross-platform**: Place in `global/keys.lua`
- **Merge**: Use `utils.join()` for combining key tables

## Review Process

### What We Look For

- **Code quality**: Clean, readable, well-documented
- **Functionality**: Features work as intended
- **Compatibility**: Doesn't break existing functionality
- **Testing**: Evidence of testing on target platforms
- **Documentation**: Updates to docs when needed

### Review Timeline

- **Initial response**: Within 48 hours
- **Review completion**: Within 1 week for simple changes
- **Complex features**: May require multiple review rounds

## Communication

### Getting Help

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and general discussion
- **Pull Request Comments**: For specific implementation feedback

### Code of Conduct

- Be **respectful** and **constructive** in all interactions
- **Focus on the code**, not the person
- **Welcome newcomers** and help them learn
- **Assume good intentions** from contributors

## License

By contributing to this project, you agree that your contributions will be licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Recognition

Contributors will be recognized in:
- **CHANGELOG.md** for their contributions
- **README.md** acknowledgments section
- **Git history** as permanent record

Thank you for contributing to this WezTerm configuration! 🚀