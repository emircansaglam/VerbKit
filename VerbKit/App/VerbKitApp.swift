//
//  VerbKitApp.swift
//  VerbKit
//
//  Created by emircan.saglam on 4.02.2026.
//

import SwiftUI
import SwiftData

@main
struct VerbKitApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([
            VerbProgressRecord.self,
            QuizSessionRecord.self,
            DailyStreakRecord.self
        ])
        let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("VerbKit: ModelContainer oluşturulamadı — \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
        .modelContainer(container)
    }
}
