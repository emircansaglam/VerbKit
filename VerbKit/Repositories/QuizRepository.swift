//
//  QuizRepository.swift
//  VerbKit
//
//  Created by emircan.saglam on 6.03.2026.
//

import Foundation
import SwiftData

// MARK: - Protocol

protocol QuizRepositoryProtocol {
    func saveSession(_ session: QuizSessionRecord, context: ModelContext)
    func fetchSessions(context: ModelContext) -> [QuizSessionRecord]
    func fetchSessions(for category: VerbCategory, context: ModelContext) -> [QuizSessionRecord]
    func totalCorrect(context: ModelContext) -> Int
    func totalAnswered(context: ModelContext) -> Int
    func overallSuccessRate(context: ModelContext) -> Double
}

// MARK: - Implementation

struct QuizRepository: QuizRepositoryProtocol {

    func saveSession(_ session: QuizSessionRecord, context: ModelContext) {
        context.insert(session)
    }

    func fetchSessions(context: ModelContext) -> [QuizSessionRecord] {
        let descriptor = FetchDescriptor<QuizSessionRecord>(
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func fetchSessions(for category: VerbCategory, context: ModelContext) -> [QuizSessionRecord] {
        let raw = category.rawValue
        let descriptor = FetchDescriptor<QuizSessionRecord>(
            predicate: #Predicate { $0.categoryRaw == raw },
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
        return (try? context.fetch(descriptor)) ?? []
    }

    func totalCorrect(context: ModelContext) -> Int {
        fetchSessions(context: context).reduce(0) { $0 + $1.correctCount }
    }

    func totalAnswered(context: ModelContext) -> Int {
        fetchSessions(context: context).reduce(0) { $0 + $1.totalQuestions }
    }

    func overallSuccessRate(context: ModelContext) -> Double {
        let answered = totalAnswered(context: context)
        guard answered > 0 else { return 0 }
        return Double(totalCorrect(context: context)) / Double(answered)
    }
}

// MARK: - Mock

struct MockQuizRepository: QuizRepositoryProtocol {

    func saveSession(_ session: QuizSessionRecord, context: ModelContext) {}

    func fetchSessions(context: ModelContext) -> [QuizSessionRecord] {
        [
            QuizSessionRecord(
                date: .now,
                totalQuestions: 10,
                correctCount: 8,
                durationSeconds: 120,
                category: .irregular
            ),
            QuizSessionRecord(
                date: Calendar.current.date(byAdding: .day, value: -1, to: .now) ?? .now,
                totalQuestions: 10,
                correctCount: 6,
                durationSeconds: 95,
                category: .phrasal
            )
        ]
    }

    func fetchSessions(for category: VerbCategory, context: ModelContext) -> [QuizSessionRecord] {
        fetchSessions(context: context).filter { $0.category == category }
    }

    func totalCorrect(context: ModelContext) -> Int { 14 }
    func totalAnswered(context: ModelContext) -> Int { 20 }
    func overallSuccessRate(context: ModelContext) -> Double { 0.7 }
}
