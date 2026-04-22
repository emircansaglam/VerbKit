//
//  HomeViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI
import SwiftData

@Observable
final class HomeViewModel {
    var dailyProgress: Int = 0
    var dailyGoal: Int = 10
    var streak: Int = 0
    var lastStudiedCategory: HomeCategory?
    var categories: [HomeCategory] = []
    var dailyTip: String = ""

    private let verbRepository: any VerbRepositoryProtocol
    private let streakRepository: any StreakRepositoryProtocol

    init(
        verbRepository: any VerbRepositoryProtocol = VerbRepository(),
        streakRepository: any StreakRepositoryProtocol = StreakRepository()
    ) {
        self.verbRepository = verbRepository
        self.streakRepository = streakRepository
        loadCategories()
        loadDailyTip()
    }

    func loadData(context: ModelContext) {
        streak = streakRepository.currentStreak(context: context)
        loadDailyProgress(context: context)
    }

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

    // MARK: - Private

    private func loadDailyProgress(context: ModelContext) {
        let allVerbs = verbRepository.fetchVerbs(category: nil, level: nil, search: "")
        let todayStart = Calendar.current.startOfDay(for: .now)

        dailyProgress = allVerbs.filter { verb in
            guard let record = verbRepository.fetchProgress(verbId: verb.id, context: context),
                  let lastSeen = record.lastSeenAt else { return false }
            return lastSeen >= todayStart
        }.count
    }

    private func loadCategories() {
        let allVerbs = verbRepository.fetchVerbs(category: nil, level: nil, search: "")

        categories = VerbCategory.allCases.map { category in
            let categoryVerbs = allVerbs.filter { $0.category == category }
            return HomeCategory(
                id: category.rawValue,
                name: category.displayName,
                icon: category.icon,
                color: category.color,
                progress: 0,
                totalVerbs: categoryVerbs.count
            )
        }

        lastStudiedCategory = categories.first
    }

    private func loadDailyTip() {
        let tips = [
            "Practice 10 minutes daily for better retention! 🎯",
            "Irregular verbs are tricky — focus on them first! ⚡",
            "Try using new verbs in sentences to remember them! ✍️",
            "Phrasal verbs change meaning completely — learn them in context! 🔄",
            "Review yesterday's verbs before learning new ones! 📚"
        ]
        dailyTip = tips.randomElement() ?? tips[0]
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
