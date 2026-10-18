<p align="center">
  <img src="Images/pic1.png" alt="MacMascot Banner" width="240" />
</p>

<h1 align="center">MacMascot Desktop Widget</h1>

<p align="center">
  <b>A charming, native macOS 1×1 desktop widget that brings your screen to life with rotating mascot poses.</b>
</p>

<p align="center">
  <a href="#features"><img src="https://img.shields.io/badge/macOS-14.0%2B%20(Sonoma%20%2F%20Sequoia)-black?style=for-the-badge&logo=apple&logoColor=white" alt="macOS" /></a>
  <a href="#how-to-build--install"><img src="https://img.shields.io/badge/Swift-5.9%2B-F05138?style=for-the-badge&logo=swift&logoColor=white" alt="Swift" /></a>
  <a href="#how-to-add-the-widget-to-your-desktop"><img src="https://img.shields.io/badge/WidgetKit-Native-007AFF?style=for-the-badge&logo=apple&logoColor=white" alt="WidgetKit" /></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="License" /></a>
</p>

---

## 🌟 Mascot Pose Showcase

The widget automatically cycles through high-resolution, full-color mascot poses every 30 minutes to accompany your workday:

<div align="center">
  <table>
    <tr>
      <td align="center" width="16.6%" valign="bottom">
        <img src="Images/pic1.png" height="140" alt="Pose 1" /><br />
        <b>Pose 1</b><br />
        <sub>Happy Welcome</sub>
      </td>
      <td align="center" width="16.6%" valign="bottom">
        <img src="Images/pic2.png" height="124" alt="Pose 2" /><br />
        <b>Pose 2</b><br />
        <sub>Deep Focus</sub>
      </td>
      <td align="center" width="16.6%" valign="bottom">
        <img src="Images/pic3.png" height="130" alt="Pose 3" /><br />
        <b>Pose 3</b><br />
        <sub>Cheering On</sub>
      </td>
      <td align="center" width="16.6%" valign="bottom">
        <img src="Images/pic7.png" height="110" alt="Pose 7" /><br />
        <b>Pose 7</b><br />
        <sub>Playful Joy</sub>
      </td>
      <td align="center" width="16.6%" valign="bottom">
        <img src="Images/pic8.png" height="110" alt="Pose 8" /><br />
        <b>Pose 8</b><br />
        <sub>Chill Snack</sub>
      </td>
      <td align="center" width="16.6%" valign="bottom">
        <img src="Images/pic9.png" height="105" alt="Pose 9" /><br />
        <b>Pose 9</b><br />
        <sub>Night Owl</sub>
      </td>
    </tr>
  </table>
</div>

---

## ✨ Features

- 🎨 **Original Mascot Artwork:** Preserves full 32-bit RGBA color without tinting, silhouette inversion, or monochrome template masking.
- 📐 **Maximized & Centered:** Perfectly scaled to ~90% of the safe widget frame without clipping or overflowing boundaries.
- ⏱️ **Automatic 30-Minute Rotation:** Smart timeline generation smoothly transitions through poses throughout the 24-hour cycle.
- 🪟 **Transparent Widget Background:** Built with `.containerBackground(for: .widget) { Color.clear }` for a clean aesthetic.
- 🧹 **Zero UI Clutter:** Pure mascot presentation—no arbitrary labels, border lines, or companion debug overlays.
- 🔒 **Sandboxed & ExtensionKit Ready:** Fully declared with `com.apple.security.app-sandbox` for native compatibility with macOS Sonoma & Sequoia's `chronod` widget daemon.

---

## 🚀 Quick Install (TL;DR)

If you already have the repository cloned, build and install in one step:

```bash
cd FloatingMascotXcode
./build.sh
cp -R build/Build/Products/Release/FloatingMascot.app /Applications/
killall NotificationCenter || true
open /Applications/FloatingMascot.app
```

Then right-click your Mac desktop, select **Edit Widgets…**, and add **Floating Mascot**.

---

## 📁 Directory Structure

```
MascotYasharthKesarwani/
├── README.md                                 # Project documentation & previews
├── LICENSE                                   # MIT License
├── Images/                                   # High-resolution mascot artwork PNGs
│   ├── pic1.png
│   ├── pic2.png
│   ├── pic3.png
│   ├── pic4.png
│   ├── pic5.png
│   ├── pic7.png
│   ├── pic8.png
│   └── pic9.png
└── FloatingMascotXcode/                       # Native Xcode & WidgetKit project
    ├── build.sh                              # Automated build & packaging script
    ├── project.yml                           # XcodeGen project specification
    ├── FloatingMascot.xcodeproj              # Xcode project bundle
    ├── FloatingMascotApp.entitlements        # Host application entitlements
    ├── FloatingMascotWidgetExtension.entitlements # Widget extension entitlements
    ├── FloatingMascotApp/                    # Host macOS application
    │   ├── FloatingMascotApp.swift           # App entry point
    │   ├── Assets.xcassets                   # App asset catalog (AppIcon, etc.)
    │   └── Info.plist                        # Host application metadata
    └── FloatingMascotWidgetExtension/        # WidgetKit extension
        ├── FloatingMascotWidget.swift        # TimelineProvider & SwiftUI Widget view
        ├── Assets.xcassets                   # Full-resolution pose image sets
        └── Info.plist                        # Extension metadata
```

---

## 🛠️ How to Build & Install

### 1. Build via Terminal
To build the host application and the WidgetKit extension with Xcode:

```bash
cd FloatingMascotXcode
./build.sh
```

The script compiles the project in `Release` mode to:
```
FloatingMascotXcode/build/Build/Products/Release/FloatingMascot.app
```

### 2. Install to Applications
Copy the bundle into `/Applications` so macOS system daemons register the widget extension:

```bash
cp -R build/Build/Products/Release/FloatingMascot.app /Applications/
killall NotificationCenter || true
open /Applications/FloatingMascot.app
```

---

## 🖥️ Adding the Widget to Your Mac Desktop

1. **Right-click** anywhere on your desktop and select **Edit Widgets…** (or open the **Notification Center** and click **Edit Widgets** at the bottom).
2. In the widget picker search box on the top-left, type **`Floating Mascot`**.
3. Drag the **1×1 small widget** directly onto your desktop or Notification Center.
4. Click **Done** in the bottom-right corner.

---

## ⏰ Rotation Schedule

The widget generates a 24-hour timeline that automatically updates every 30 minutes:

| Slot | Mascot Pose | Preview | Active Interval |
| :---: | :---: | :---: | :--- |
| **01** | `pic1` | <img src="Images/pic1.png" height="70" alt="pic1" /> | `00:00 – 00:30` |
| **02** | `pic2` | <img src="Images/pic2.png" height="62" alt="pic2" /> | `00:30 – 01:00` |
| **03** | `pic3` | <img src="Images/pic3.png" height="65" alt="pic3" /> | `01:00 – 01:30` |
| **04** | `pic7` | <img src="Images/pic7.png" height="55" alt="pic7" /> | `01:30 – 02:00` |
| **05** | `pic8` | <img src="Images/pic8.png" height="55" alt="pic8" /> | `02:00 – 02:30` |
| **06** | `pic9` | <img src="Images/pic9.png" height="52" alt="pic9" /> | `02:30 – 03:00` |
| 🔄 | *(Repeats)* | — | *(Cycles back to `pic1`)* |

### Customizing the Rotation Interval
To change how often the pose switches, open `FloatingMascotXcode/FloatingMascotWidgetExtension/FloatingMascotWidget.swift` and modify the minute interval:

```swift
// Example: Change from 30 to 15 minutes
let entryDate = Calendar.current.date(byAdding: .minute, value: index * 15, to: currentDate)!
```

After editing, re-run `./build.sh` and re-copy to `/Applications`.

---

## ⚙️ Technical Details & macOS Widget Architecture

- **Sandboxing Requirement:** macOS Sonoma & Sequoia (`chronod`) strictly mandate `com.apple.security.app-sandbox` for all WidgetKit extensions. This is configured in `project.yml` under target entitlements to persist across `xcodegen` rebuilds.
- **Original Color Preservation:** To prevent macOS from converting mascot frames into monochrome silhouettes in dark or tinted desktop modes, all asset catalogs specify `"template-rendering-intent": "original"` in their `Contents.json`, and SwiftUI renders with `.renderingMode(.original)`.
- **System Card Plate:** macOS desktop widgets are rendered inside an OS-level container plate by `NotificationCenter`. While `.containerBackground(for: .widget) { Color.clear }` clears all custom background styles inside the widget, the underlying squircle frame is controlled by macOS system settings (**System Settings → Desktop & Dock → Widgets → Widget style**).

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
