//
//  StatsViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI
import SwiftData

@Observable
final class StatsViewModel {
    var currentStreak: Int = 0
    var totalLearnedVerbs: Int = 0
    var masteredVerbs: Int = 0
    var weeklyActivity: [DayActivity] = []
    var categoryProgress: [CategoryProgress] = []
    var achievements: [Achievement] = []

    private let verbRepository: any VerbRepositoryProtocol
    private let quizRepository: any QuizRepositoryProtocol
    private let streakRepository: any StreakRepositoryProtocol

    init(
        verbRepository: any VerbRepositoryProtocol = VerbRepository(),
        quizRepository: any QuizRepositoryProtocol = QuizRepository(),
        streakRepository: any StreakRepositoryProtocol = StreakRepository()
    ) {
        self.verbRepository = verbRepository
        self.quizRepository = quizRepository
        self.streakRepository = streakRepository
    }

    func loadData(context: ModelContext) {
        currentStreak = streakRepository.currentStreak(context: context)
        loadVerbProgress(context: context)
        loadWeeklyActivity(context: context)
        loadCategoryProgress(context: context)
        loadAchievements(context: context)
    }

    // MARK: - Private

    private func loadVerbProgress(context: ModelContext) {
        let allVerbs = verbRepository.fetchVerbs(category: nil, level: nil, search: "")

        totalLearnedVerbs = allVerbs.filter { verb in
            guard let record = verbRepository.fetchProgress(verbId: verb.id, context: context) else { return false }
            return record.totalAnswered > 0
        }.count

        masteredVerbs = allVerbs.filter { verb in
            guard let record = verbRepository.fetchProgress(verbId: verb.id, context: context) else { return false }
            return record.stars == 3
        }.count
    }

    private func loadWeeklyActivity(context: ModelContext) {
        let sessions = quizRepository.fetchSessions(context: context)
        let calendar = Calendar.current

        weeklyActivity = (0..<7).reversed().map { daysAgo in
            let date = calendar.date(byAdding: .day, value: -daysAgo, to: .now) ?? .now
            let dayStart = calendar.startOfDay(for: date)
            let dayEnd = calendar.date(byAdding: .day, value: 1, to: dayStart) ?? date

            let verbCount = sessions
                .filter { $0.date >= dayStart && $0.date < dayEnd }
                .reduce(0) { $0 + $1.totalQuestions }

            let formatter = DateFormatter()
            formatter.dateFormat = "EEE"

            return DayActivity(
                day: formatter.string(from: date),
                verbCount: verbCount,
                isToday: daysAgo == 0
            )
        }
    }

    private func loadCategoryProgress(context: ModelContext) {
        let allVerbs = verbRepository.fetchVerbs(category: nil, level: nil, search: "")

        categoryProgress = VerbCategory.allCases.map { category in
            let categoryVerbs = allVerbs.filter { $0.category == category }
            let learnedCount = categoryVerbs.filter { verb in
                guard let record = verbRepository.fetchProgress(verbId: verb.id, context: context) else { return false }
                return record.totalAnswered > 0
            }.count

            let progress = categoryVerbs.isEmpty ? 0.0 : Double(learnedCount) / Double(categoryVerbs.count)

            return CategoryProgress(
                name: category.displayName,
                icon: category.icon,
                color: category.color,
                progress: progress,
                learned: learnedCount,
                total: categoryVerbs.count
            )
        }
    }

    private func loadAchievements(context: ModelContext) {
        achievements = [
            Achievement(
                id: "first_verb",
                title: "First Verb",
                description: "Learn your first verb",
                icon: "🌱",
                isUnlocked: totalLearnedVerbs >= 1
            ),
            Achievement(
                id: "on_fire",
                title: "On Fire!",
                description: "7 day streak",
                icon: "🔥",
                isUnlocked: currentStreak >= 7
            ),
            Achievement(
                id: "bookworm",
                title: "Bookworm",
                description: "Learn 50 verbs",
                icon: "📚",
                isUnlocked: totalLearnedVerbs >= 50
            ),
            Achievement(
                id: "first_master",
                title: "First Master",
                description: "Master your first verb",
                icon: "⭐",
                isUnlocked: masteredVerbs >= 1
            ),
            Achievement(
                id: "irregular_hero",
                title: "Irregular Hero",
                description: "Learn all irregular verbs",
                icon: "⚡",
                isUnlocked: categoryProgress.first { $0.name == "Irregular" }?.progress == 1.0
            ),
            Achievement(
                id: "centurion",
                title: "Centurion",
                description: "Learn 100 verbs",
                icon: "🏆",
                isUnlocked: totalLearnedVerbs >= 100
            )
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
