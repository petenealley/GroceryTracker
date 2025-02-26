//
//  GroceryTrackerApp.swift
//  GroceryTracker
//
//  Created by Pete Nealley on 2/25/25.
//

import SwiftUI
import SwiftData

@main
struct GroceryTrackerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Category.self,
            GroceryItem.self,
            PriceRecord.self,
            Store.self,
            Chain.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
