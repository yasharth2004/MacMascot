import WidgetKit
import SwiftUI
import AppKit

// MARK: - Mascot Timeline Entry
struct MascotEntry: TimelineEntry {
    let date: Date
    let imageName: String
}

// MARK: - 30-Minute Rotation Timeline Provider
struct MascotProvider: TimelineProvider {
    let allImages = ["pic1", "pic2", "pic3", "pic7", "pic8", "pic9"]

    func placeholder(in context: Context) -> MascotEntry {
        MascotEntry(date: Date(), imageName: "pic1")
    }

    func getSnapshot(in context: Context, completion: @escaping (MascotEntry) -> ()) {
        completion(MascotEntry(date: Date(), imageName: "pic1"))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MascotEntry>) -> ()) {
        var entries: [MascotEntry] = []
        let currentDate = Date()
        
        // Generate timeline entries rotating every 30 minutes for the next 24 hours (48 entries)
        for index in 0..<48 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: index * 30, to: currentDate)!
            let imageName = allImages[index % allImages.count]
            entries.append(MascotEntry(date: entryDate, imageName: imageName))
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

// MARK: - Mascot Image Helper
private func loadOriginalMascotImage(named imageName: String) -> NSImage? {
    if let img = NSImage(named: NSImage.Name(imageName)) {
        return img
    }
    if let url = Bundle.main.url(forResource: imageName, withExtension: "png"),
       let img = NSImage(contentsOf: url) {
        return img
    }
    return nil
}

// MARK: - Pure Centered Mascot Widget View
struct FloatingMascotWidgetEntryView: View {
    var entry: MascotProvider.Entry

    var body: some View {
        GeometryReader { proxy in
            let w = proxy.size.width
            let h = proxy.size.height
            // Maximize size while keeping safe margin so no part clips
            let mascotHeight = min(w * 0.90, h * 0.88)
            
            ZStack(alignment: .center) {
                // Completely transparent background
                Color.clear
                
                if let nsImage = loadOriginalMascotImage(named: entry.imageName) {
                    Image(nsImage: nsImage)
                        .renderingMode(.original)
                        .resizable()
                        .interpolation(.high)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: mascotHeight)
                } else {
                    Image(entry.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .interpolation(.high)
                        .aspectRatio(contentMode: .fit)
                        .frame(height: mascotHeight)
                }
            }
            .frame(width: w, height: h, alignment: .center)
        }
        .containerBackground(for: .widget) {
            Color.clear
        }
    }
}

// MARK: - Widget Configuration
@main
struct FloatingMascotWidget: Widget {
    let kind: String = "FloatingMascotWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MascotProvider()) { entry in
            FloatingMascotWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Floating Mascot")
        .description("Your mascot companion rotating every 30 minutes.")
        .supportedFamilies([.systemSmall])
        .contentMarginsDisabled()
    }
}
