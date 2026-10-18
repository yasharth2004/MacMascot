#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

echo "Building Mascot Widget and Host App..."
xcodebuild \
    -project "$DIR/FloatingMascot.xcodeproj" \
    -scheme FloatingMascot \
    -configuration Release \
    -derivedDataPath "$DIR/build" \
    build

echo ""
echo "Build complete! The app and widget extension are at:"
echo "$DIR/build/Build/Products/Release/FloatingMascot.app"
