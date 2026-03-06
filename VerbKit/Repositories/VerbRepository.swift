//
//  VerbRepository.swift
//  VerbKit
//
//  Created by emircan.saglam on 20.02.2026.
//

import Foundation
import SwiftData

// MARK: - Protocol

protocol VerbRepositoryProtocol {
    func fetchVerbs(category: VerbCategory?, level: VerbLevel?, search: String) -> [Verb]
    func fetchVerb(id: String) -> Verb?
    func recordAnswer(verbId: String, correct: Bool, context: ModelContext)
    func fetchProgress(verbId: String, context: ModelContext) -> VerbProgressRecord?
}

// MARK: - Implementation

struct VerbRepository: VerbRepositoryProtocol {

    private let verbService: any VerbServiceProtocol

    init(verbService: any VerbServiceProtocol = VerbService()) {
        self.verbService = verbService
    }

    // MARK: - Fetch

    func fetchVerbs(
        category: VerbCategory? = nil,
        level: VerbLevel? = nil,
        search: String = ""
    ) -> [Verb] {
        verbService.verbs(category: category, level: level, search: search)
    }

    func fetchVerb(id: String) -> Verb? {
        verbService.loadVerbs().first { $0.id == id }
    }

    // MARK: - Progress

    func recordAnswer(verbId: String, correct: Bool, context: ModelContext) {
        let record = fetchOrCreateProgress(verbId: verbId, context: context)
        record.recordAnswer(correct: correct)
    }

    func fetchProgress(verbId: String, context: ModelContext) -> VerbProgressRecord? {
        let descriptor = FetchDescriptor<VerbProgressRecord>(
            predicate: #Predicate { $0.verbId == verbId }
        )
        return try? context.fetch(descriptor).first
    }

    // MARK: - Private

    private func fetchOrCreateProgress(verbId: String, context: ModelContext) -> VerbProgressRecord {
        if let existing = fetchProgress(verbId: verbId, context: context) {
            return existing
        }
        let record = VerbProgressRecord(verbId: verbId)
        context.insert(record)
        return record
    }
}

// MARK: - Mock

struct MockVerbRepository: VerbRepositoryProtocol {

    var mockVerbs: [Verb] = MockVerbService().loadVerbs()

    func fetchVerbs(category: VerbCategory?, level: VerbLevel?, search: String) -> [Verb] {
        var result = mockVerbs
        if let category { result = result.filter { $0.category == category } }
        if let level    { result = result.filter { $0.level == level } }
        if !search.isEmpty {
            let query = search.lowercased()
            result = result.filter {
                $0.baseForm.lowercased().contains(query) ||
                $0.meaning.lowercased().contains(query)
            }
        }
        return result
    }

    func fetchVerb(id: String) -> Verb? {
        mockVerbs.first { $0.id == id }
    }

    func recordAnswer(verbId: String, correct: Bool, context: ModelContext) {}
    func fetchProgress(verbId: String, context: ModelContext) -> VerbProgressRecord? { nil }
}
