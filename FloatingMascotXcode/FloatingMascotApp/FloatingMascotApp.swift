import SwiftUI

@main
struct FloatingMascotApp: App {
    var body: some Scene {
        WindowGroup {
            VStack(spacing: 16) {
                Image("pic1")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                
                Text("Floating Mascot")
                    .font(.title2.bold())
                
                Text("Your desktop widget is ready!\nRight-click your Desktop or Notification Center → Edit Widgets → Drag 'Floating Mascot' onto your desktop.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
            }
            .frame(width: 360, height: 300)
        }
        .windowResizability(.contentSize)
    }
}
