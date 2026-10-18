# Mascot Desktop Widget for macOS

A native macOS 1×1 desktop widget built with **SwiftUI** and **WidgetKit** that displays your custom mascot on the Mac desktop and rotates through poses every 30 minutes.

---

## Features

- **Original Mascot Artwork:** Preserves the full-color PNG artwork without tinting or template discoloration.
- **Centered & Maximized:** Occupies ~90% of the widget tile with preserved aspect ratio and safe boundaries so the character is never cropped.
- **Transparent View Background:** Configured with `.containerBackground(for: .widget) { Color.clear }`.
- **Automatic 30-Minute Rotation:** Cycles smoothly through all available poses (`pic1` → `pic2` → `pic3` → `pic7` → `pic8` → `pic9`) throughout the day.
- **Zero UI Clutter:** Pure mascot display with no labels, buttons, borders, or extra chrome.
- **Apple Sandbox & ExtensionKit Compliant:** Fully configured with `com.apple.security.app-sandbox` for compatibility with macOS Sonoma and Sequoia's `chronod` widget daemon.

---

## Directory Structure

```
MascotYasharthKesarwani/
├── README.md                                 # Project documentation
├── LICENSE                                   # MIT License
├── Images/                                   # Original high-res mascot PNGs
│   ├── pic1.png
│   ├── pic2.png
│   ├── pic3.png
│   ├── pic4.png
│   ├── pic5.png
│   ├── pic7.png
│   ├── pic8.png
│   └── pic9.png
└── FloatingMascotXcode/                       # Native Xcode project
    ├── build.sh                              # Automated build script
    ├── project.yml                           # XcodeGen project specification
    ├── FloatingMascot.xcodeproj              # Xcode project bundle
    ├── FloatingMascotApp.entitlements        # Host application entitlements
    ├── FloatingMascotWidgetExtension.entitlements # Widget extension entitlements
    ├── FloatingMascotApp/                    # Host macOS application
    │   ├── FloatingMascotApp.swift           # Main app entry point
    │   ├── Assets.xcassets                   # App asset catalog
    │   └── Info.plist                        # App metadata
    └── FloatingMascotWidgetExtension/        # WidgetKit extension
        ├── FloatingMascotWidget.swift        # Timeline provider & widget view
        ├── Assets.xcassets                   # Widget asset catalog
        └── Info.plist                        # Extension metadata
```

---

## How to Build & Install

### 1. Build from Terminal
To build the application and widget extension:

```bash
cd FloatingMascotXcode
./build.sh
```

The script compiles the project in `Release` configuration and outputs:
```
FloatingMascotXcode/build/Build/Products/Release/FloatingMascot.app
```

### 2. Install to Applications
Copy the built bundle to your `/Applications` directory to make the widget permanently available to macOS:

```bash
cp -R build/Build/Products/Release/FloatingMascot.app /Applications/
killall NotificationCenter || true
open /Applications/FloatingMascot.app
```

---

## How to Add the Widget to Your Desktop

1. Right-click anywhere on your Mac desktop and select **Edit Widgets…** (or open **Notification Center** and click **Edit Widgets** at the bottom).
2. In the widget gallery search bar on the top-left, search for **`Floating Mascot`**.
3. Drag the **1×1 small widget** onto your desktop.
4. Click **Done** in the bottom-right corner.

---

## Rotation Schedule

The widget generates a 24-hour timeline that automatically rotates poses every 30 minutes:

| Time Interval | Mascot Pose |
| :--- | :--- |
| **00:00 – 00:30** | `pic1` |
| **00:30 – 01:00** | `pic2` |
| **01:00 – 01:30** | `pic3` |
| **01:30 – 02:00** | `pic7` |
| **02:00 – 02:30** | `pic8` |
| **02:30 – 03:00** | `pic9` |
| *(Repeats)* | *(Cycles back to `pic1`)* |

### Customizing the Rotation Interval
To change how often the picture updates, open `FloatingMascotXcode/FloatingMascotWidgetExtension/FloatingMascotWidget.swift` and edit the minute multiplier in `getTimeline`:

```swift
// Example: Change from 30 to 15 minutes
let entryDate = Calendar.current.date(byAdding: .minute, value: index * 15, to: currentDate)!
```

After modifying, re-run `./build.sh`.

---

## Technical Details & macOS Widget Quirks

- **Sandboxing Requirement:** macOS Sonoma/Sequoia's `chronod` requires all WidgetKit extensions to include the `com.apple.security.app-sandbox` entitlement. This is defined in `FloatingMascotXcode/project.yml` under `entitlements.properties` so it persists whenever `xcodegen` regenerates the project.
- **Original Color Preservation:** To prevent macOS from converting mascot frames into monochrome silhouettes in dark or tinted desktop modes, all asset catalogs specify `"template-rendering-intent": "original"` in their `Contents.json`, and SwiftUI renders with `.renderingMode(.original)`.
- **System Card Plate:** macOS desktop widgets are rendered inside an OS-level container plate by `NotificationCenter`. While `.containerBackground(for: .widget) { Color.clear }` clears all custom background styles inside the widget, the underlying squircle frame is controlled by macOS system settings (**System Settings → Desktop & Dock → Widgets → Widget style**).

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
