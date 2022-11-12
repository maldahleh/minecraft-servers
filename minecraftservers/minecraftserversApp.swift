//
//  minecraftserversApp.swift
//  minecraftservers
//
//  Created by Mohammed Al-Dahleh on 2022-11-12.
//

import SwiftUI

@main
struct minecraftserversApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
