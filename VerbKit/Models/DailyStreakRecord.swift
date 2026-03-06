//
//  DailyStreakRecord.swift
//  VerbKit
//
//  Created by emircan.saglam on 20.02.2026.
//

import Foundation
import SwiftData

@Model
final class DailyStreakRecord {
    var currentStreak: Int
    var longestStreak: Int
    var lastActiveDate: Date?

    init() {
        self.currentStreak = 0
        self.longestStreak = 0
        self.lastActiveDate = nil
    }

    // MARK: - Logic

    /// Call this when the user completes a quiz session.
    func markActiveToday() {
        let today = Calendar.current.startOfDay(for: .now)

        guard let last = lastActiveDate else {
            // First time ever
            currentStreak = 1
            longestStreak = 1
            lastActiveDate = today
            return
        }

        let lastDay = Calendar.current.startOfDay(for: last)

        if lastDay == today {
            // Already active today, nothing to do
            return
        }

        let daysBetween = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0

        if daysBetween == 1 {
            // Consecutive day
            currentStreak += 1
            longestStreak = max(longestStreak, currentStreak)
        } else {
            // Streak broken
            currentStreak = 1
        }

        lastActiveDate = today
    }

    var isActiveToday: Bool {
        guard let last = lastActiveDate else { return false }
        return Calendar.current.isDateInToday(last)
    }
}
