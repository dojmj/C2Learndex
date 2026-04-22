//
//  LearndexApp.swift
//  Learndex
//
//  Created by 조민지 on 4/21/26.
//

import SwiftUI
import SwiftData
import MultipeerConnectivity

@main
struct Challenge2App: App {
//    @StateObject private var multipeerService = MultipeerService()
    
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
//                .environmentObject(multipeerService)
        }
        
        .modelContainer(sharedModelContainer)
    }
}
