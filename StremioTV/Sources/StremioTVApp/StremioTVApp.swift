import SwiftUI
import StremioCore
import AVKit

@main
struct StremioTVApp: App {
    init() {
        // Initialize Stremio Core at app launch
        _ = Core.initialize()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
