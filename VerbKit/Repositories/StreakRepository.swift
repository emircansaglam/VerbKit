//
//  StreakRepository.swift
//  VerbKit
//
//  Created by emircan.saglam on 6.03.2026.
//

import Foundation
import SwiftData

// MARK: - Protocol

protocol StreakRepositoryProtocol {
    func fetchStreak(context: ModelContext) -> DailyStreakRecord
    func markActiveToday(context: ModelContext)
    func currentStreak(context: ModelContext) -> Int
    func longestStreak(context: ModelContext) -> Int
    func isActiveToday(context: ModelContext) -> Bool
}

// MARK: - Implementation

struct StreakRepository: StreakRepositoryProtocol {

    func fetchStreak(context: ModelContext) -> DailyStreakRecord {
        let descriptor = FetchDescriptor<DailyStreakRecord>()
        if let existing = try? context.fetch(descriptor).first {
            return existing
        }
        let record = DailyStreakRecord()
        context.insert(record)
        return record
    }

    func markActiveToday(context: ModelContext) {
        let record = fetchStreak(context: context)
        record.markActiveToday()
    }

    func currentStreak(context: ModelContext) -> Int {
        fetchStreak(context: context).currentStreak
    }

    func longestStreak(context: ModelContext) -> Int {
        fetchStreak(context: context).longestStreak
    }

    func isActiveToday(context: ModelContext) -> Bool {
        fetchStreak(context: context).isActiveToday
    }
}

// MARK: - Mock

struct MockStreakRepository: StreakRepositoryProtocol {

    func fetchStreak(context: ModelContext) -> DailyStreakRecord {
        DailyStreakRecord()
    }

    func markActiveToday(context: ModelContext) {}
    func currentStreak(context: ModelContext) -> Int { 5 }
    func longestStreak(context: ModelContext) -> Int { 12 }
    func isActiveToday(context: ModelContext) -> Bool { true }
}
