//
//  LearndexApp.swift
//  Learndex
//
//  Created by 조민지 on 4/21/26.
//

import SwiftUI
import SwiftData

@main
struct Challenge2App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Learner.self
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
                .preferredColorScheme(.dark)
        }
        
        .modelContainer(sharedModelContainer)
    }
}
