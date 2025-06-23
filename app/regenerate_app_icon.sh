#!/bin/bash

# Script to regenerate app launcher icons from SVG source
# This script converts the SVG to PNG and regenerates all platform-specific launcher icons

echo "🎨 Regenerating Weather App Launcher Icons..."

# Navigate to the app directory
cd "$(dirname "$0")"

# Check if the SVG source exists
if [ ! -f "assets/images/app_icon.svg" ]; then
    echo "❌ Error: app_icon.svg not found in assets/images/"
    exit 1
fi

# Convert SVG to PNG at 1024x1024 resolution using macOS sips
echo "📱 Converting SVG to PNG (1024x1024)..."
sips -s format png assets/images/app_icon.svg --out assets/images/app_icon.png -Z 1024

if [ $? -eq 0 ]; then
    echo "✅ SVG converted to PNG successfully"
else
    echo "❌ Error converting SVG to PNG"
    exit 1
fi

# Regenerate launcher icons for all platforms
echo "🚀 Regenerating launcher icons for all platforms..."
dart run flutter_launcher_icons

if [ $? -eq 0 ]; then
    echo "✅ Launcher icons generated successfully for all platforms!"
    echo ""
    echo "Generated icons for:"
    echo "  📱 Android (multiple densities)"
    echo "  🍎 iOS (App Store compliant)"
    echo "  🌐 Web (PWA icons)"
    echo "  🪟 Windows"
    echo "  🖥️  macOS"
    echo ""
    echo "You can now build and run the app to see the new icon!"
else
    echo "❌ Error generating launcher icons"
    exit 1
fi
