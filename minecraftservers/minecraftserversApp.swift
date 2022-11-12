import SwiftUI

@main
struct minecraftserversApp: App {
    let updater = DataUpdater()
    
    init() {
        updater.setupTimer()
    }

    var body: some Scene {
        WindowGroup {
            ServerListView()
        }
    }
}
