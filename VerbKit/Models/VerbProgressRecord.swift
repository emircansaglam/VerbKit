//
//  VerbProgressRecord.swift
//  VerbKit
//
//  Created by emircan.saglam on 20.02.2026.
//

import Foundation
import SwiftData

@Model
final class VerbProgressRecord {
    @Attribute(.unique) var verbId: String
    var correctCount: Int
    var incorrectCount: Int
    var stars: Int          // 0-3
    var lastSeenAt: Date?

    init(verbId: String) {
        self.verbId = verbId
        self.correctCount = 0
        self.incorrectCount = 0
        self.stars = 0
        self.lastSeenAt = nil
    }

    // MARK: - Computed

    var totalAnswered: Int { correctCount + incorrectCount }

    var successRate: Double {
        guard totalAnswered > 0 else { return 0 }
        return Double(correctCount) / Double(totalAnswered)
    }

    // MARK: - Logic

    func recordAnswer(correct: Bool) {
        if correct {
            correctCount += 1
        } else {
            incorrectCount += 1
        }
        lastSeenAt = Date()
        updateStars()
    }

    private func updateStars() {
        guard totalAnswered >= 3 else { return }
        switch successRate {
        case 0.8...:  stars = 3
        case 0.5...:  stars = 2
        case 0.2...:  stars = 1
        default:      stars = 0
        }
    }
}
