//
//  HomeViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI

@Observable
final class HomeViewModel {
    var dailyProgress: Int = 7
    var dailyGoal: Int = 10
    var streak: Int = 5
    var lastStudiedCategory: HomeCategory?
    var categories: [HomeCategory] = []
    var dailyTip: String = "Practice makes perfect! 🎯"
    
    var timeBasedGreeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Good Morning! ☀️"
        case 12..<17: return "Good Afternoon! 🌤️"
        case 17..<22: return "Good Evening! 🌙"
        default: return "Still Learning? 🌟"
        }
    }
    
    var motivationalMessage: String {
        let messages = [
            "Ready to learn some verbs?",
            "Let's practice today!",
            "Time to level up your English!",
            "Keep up the great work!",
            "You're doing amazing!"
        ]
        return messages.randomElement() ?? "Let's learn together!"
    }
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        lastStudiedCategory = HomeCategory(
            id: "1",
            name: "Regular Verbs",
            icon: "📚",
            color: .blue,
            progress: 0.45,
            totalVerbs: 100
        )
        
        categories = [
            HomeCategory(id: "1", name: "Regular Verbs", icon: "📚", color: .blue, progress: 0.45, totalVerbs: 100),
            HomeCategory(id: "2", name: "Irregular Verbs", icon: "⚡", color: .purple, progress: 0.23, totalVerbs: 120),
            HomeCategory(id: "3", name: "Phrasal Verbs", icon: "🔄", color: .orange, progress: 0.10, totalVerbs: 80),
            HomeCategory(id: "4", name: "Modal Verbs", icon: "🎭", color: .green, progress: 0.60, totalVerbs: 40)
        ]
    }
}

// MARK: - Models
struct HomeCategory: Identifiable {
    let id: String
    let name: String
    let icon: String
    let color: Color
    let progress: Double
    let totalVerbs: Int
}
