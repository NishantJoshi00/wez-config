#!/bin/bash

# prereq.sh - Prerequisites checker and installer for WezTerm configuration
# This script checks for and installs necessary dependencies

set -e

echo "WezTerm Configuration Prerequisites Checker"
echo "=========================================="

# Check if WezTerm is installed
check_wezterm() {
    if command -v wezterm &> /dev/null; then
        echo "✓ WezTerm is installed"
        wezterm --version
    else
        echo "✗ WezTerm is not installed"
        echo "Please install WezTerm from: https://wezfurlong.org/wezterm/"
        exit 1
    fi
}

# Check for required fonts
check_fonts() {
    echo ""
    echo "Checking for recommended fonts..."
    
    fonts_to_check=("JetBrains Mono" "Iosevka" "CommitMono" "Geist Mono")
    
    for font in "${fonts_to_check[@]}"; do
        if fc-list | grep -i "$font" &> /dev/null 2>&1 || system_profiler SPFontsDataType 2>/dev/null | grep -i "$font" &> /dev/null; then
            echo "✓ $font found"
        else
            echo "⚠ $font not found (recommended but not required)"
        fi
    done
}


# Main execution
main() {
    check_wezterm
    check_fonts
    
    echo ""
    echo "Prerequisites check complete!"
    echo "You can now use this WezTerm configuration."
}

main "$@"