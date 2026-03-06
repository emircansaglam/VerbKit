//
//  QuizSessionRecord.swift
//  VerbKit
//
//  Created by emircan.saglam on 20.02.2026.
//

import Foundation
import SwiftData

@Model
final class QuizSessionRecord {
    var date: Date
    var totalQuestions: Int
    var correctCount: Int
    var durationSeconds: Int
    var categoryRaw: String?   // VerbCategory.rawValue — nil means "all"
    var levelRaw: String?      // VerbLevel.rawValue — nil means "all"

    init(
        date: Date = .now,
        totalQuestions: Int,
        correctCount: Int,
        durationSeconds: Int,
        category: VerbCategory? = nil,
        level: VerbLevel? = nil
    ) {
        self.date = date
        self.totalQuestions = totalQuestions
        self.correctCount = correctCount
        self.durationSeconds = durationSeconds
        self.categoryRaw = category?.rawValue
        self.levelRaw = level?.rawValue
    }

    // MARK: - Computed

    var incorrectCount: Int { totalQuestions - correctCount }

    var successRate: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(correctCount) / Double(totalQuestions)
    }

    var category: VerbCategory? {
        guard let raw = categoryRaw else { return nil }
        return VerbCategory(rawValue: raw)
    }

    var level: VerbLevel? {
        guard let raw = levelRaw else { return nil }
        return VerbLevel(rawValue: raw)
    }
}
