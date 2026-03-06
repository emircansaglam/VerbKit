//
//  VerbService.swift
//  VerbKit
//
//  Created by emircan.saglam on 6.03.2026.
//

import Foundation

// MARK: - Protocol

protocol VerbServiceProtocol {
    func loadVerbs() -> [Verb]
    func verbs(category: VerbCategory?, level: VerbLevel?, search: String) -> [Verb]
    func randomVerbs(count: Int, category: VerbCategory?, level: VerbLevel?) -> [Verb]
}

// MARK: - Live Implementation

struct VerbService: VerbServiceProtocol {

    private let allVerbs: [Verb]

    init() {
        guard
            let url  = Bundle.main.url(forResource: "verbs", withExtension: "json"),
            let data = try? Data(contentsOf: url)
        else {
            assertionFailure("VerbService: verbs.json not found in bundle.")
            self.allVerbs = []
            return
        }

        do {
            self.allVerbs = try JSONDecoder().decode([Verb].self, from: data)
        } catch {
            assertionFailure("VerbService: Failed to decode verbs.json — \(error)")
            self.allVerbs = []
        }
    }

    // MARK: - VerbServiceProtocol

    func loadVerbs() -> [Verb] {
        allVerbs
    }

    func verbs(
        category: VerbCategory? = nil,
        level: VerbLevel? = nil,
        search: String = ""
    ) -> [Verb] {
        var result = allVerbs

        if let category { result = result.filter { $0.category == category } }
        if let level    { result = result.filter { $0.level    == level    } }

        if !search.isEmpty {
            let query = search.lowercased()
            result = result.filter {
                $0.baseForm.lowercased().contains(query) ||
                $0.meaning.lowercased().contains(query)
            }
        }

        return result
    }

    func randomVerbs(
        count: Int,
        category: VerbCategory? = nil,
        level: VerbLevel? = nil
    ) -> [Verb] {
        let pool = verbs(category: category, level: level)
        return Array(pool.shuffled().prefix(count))
    }
}

// MARK: - Mock (Tests & Previews)

struct MockVerbService: VerbServiceProtocol {

    var mockVerbs: [Verb] = [
        Verb(
            id: "1",
            baseForm: "go",
            thirdPerson: "goes",
            pastSimple: "went",
            pastParticiple: "gone",
            category: .irregular,
            meaning: "gitmek",
            level: .a1,
            exampleSentence: "I go to school every day."
        ),
        Verb(
            id: "2",
            baseForm: "make",
            thirdPerson: "makes",
            pastSimple: "made",
            pastParticiple: "made",
            category: .irregular,
            meaning: "yapmak",
            level: .a1,
            exampleSentence: "She made a cake."
        ),
        Verb(
            id: "3",
            baseForm: "look up",
            thirdPerson: "looks up",
            pastSimple: "looked up",
            pastParticiple: "looked up",
            category: .phrasal,
            meaning: "aramak (sözlükte)",
            level: .a2,
            exampleSentence: "Look up the word in the dictionary."
        )
    ]

    func loadVerbs() -> [Verb] { mockVerbs }

    func verbs(category: VerbCategory?, level: VerbLevel?, search: String) -> [Verb] {
        var result = mockVerbs
        if let category { result = result.filter { $0.category == category } }
        if let level    { result = result.filter { $0.level    == level    } }
        if !search.isEmpty {
            let query = search.lowercased()
            result = result.filter {
                $0.baseForm.lowercased().contains(query) ||
                $0.meaning.lowercased().contains(query)
            }
        }
        return result
    }

    func randomVerbs(count: Int, category: VerbCategory?, level: VerbLevel?) -> [Verb] {
        Array(mockVerbs.shuffled().prefix(count))
    }
}
