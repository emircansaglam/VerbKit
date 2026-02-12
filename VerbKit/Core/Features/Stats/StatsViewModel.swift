//
//  StatsViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI

@Observable
final class StatsViewModel {
    var currentStreak: Int = 5
    var totalLearnedVerbs: Int = 45
    var masteredVerbs: Int = 12
    var weeklyActivity: [DayActivity] = []
    var categoryProgress: [CategoryProgress] = []
    var achievements: [Achievement] = []
    
    init() {
        loadMockData()
    }
    
    private func loadMockData() {
        loadWeeklyActivity()
        loadCategoryProgress()
        loadAchievements()
    }
    
    private func loadWeeklyActivity() {
        weeklyActivity = [
            DayActivity(day: "Mon", verbCount: 5, isToday: false),
            DayActivity(day: "Tue", verbCount: 8, isToday: false),
            DayActivity(day: "Wed", verbCount: 0, isToday: false),
            DayActivity(day: "Thu", verbCount: 3, isToday: false),
            DayActivity(day: "Fri", verbCount: 10, isToday: false),
            DayActivity(day: "Sat", verbCount: 6, isToday: false),
            DayActivity(day: "Sun", verbCount: 0, isToday: true)
        ]
    }
    
    private func loadCategoryProgress() {
        categoryProgress = [
            CategoryProgress(name: "Regular", icon: "📚", color: .blue, progress: 0.80, learned: 80, total: 100),
            CategoryProgress(name: "Irregular", icon: "⚡", color: .purple, progress: 0.40, learned: 48, total: 120),
            CategoryProgress(name: "Phrasal", icon: "🔄", color: .orange, progress: 0.20, learned: 16, total: 80),
            CategoryProgress(name: "Modal", icon: "🎭", color: .green, progress: 0.60, learned: 24, total: 40)
        ]
    }
    
    private func loadAchievements() {
        achievements = [
            Achievement(id: "1", title: "First Verb", description: "Learn your first verb", icon: "🌱", isUnlocked: true),
            Achievement(id: "2", title: "On Fire!", description: "7 day streak", icon: "🔥", isUnlocked: false),
            Achievement(id: "3", title: "Bookworm", description: "Learn 50 verbs", icon: "📚", isUnlocked: false),
            Achievement(id: "4", title: "First Master", description: "Master your first verb", icon: "⭐", isUnlocked: true),
            Achievement(id: "5", title: "Irregular Hero", description: "Learn all irregular verbs", icon: "⚡", isUnlocked: false),
            Achievement(id: "6", title: "Centurion", description: "Learn 100 verbs", icon: "🏆", isUnlocked: false)
        ]
    }
}

// MARK: - Models
struct DayActivity: Identifiable {
    let id = UUID()
    let day: String
    let verbCount: Int
    let isToday: Bool
}

struct CategoryProgress: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
    let progress: Double
    let learned: Int
    let total: Int
}

struct Achievement: Identifiable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let isUnlocked: Bool
}
