//
//  VerbListViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI
import Combine

@MainActor
final class VerbListViewModel: ObservableObject {
    @Published var verbs: [Verb] = []
    @Published var filteredVerbs: [Verb] = []
    @Published var searchText: String = ""
    @Published var selectedCategory: VerbCategory?
    
    init() {
        loadMockVerbs()
        setupSearch()
    }
    
    private func setupSearch() {
        // Filter verbs based on search and category
        $searchText
            .combineLatest($selectedCategory, $verbs)
            .map { searchText, category, verbs in
                var filtered = verbs
                
                // Filter by category
                if let category = category {
                    filtered = filtered.filter { $0.category == category }
                }
                
                // Filter by search text
                if !searchText.isEmpty {
                    filtered = filtered.filter { verb in
                        verb.baseForm.localizedCaseInsensitiveContains(searchText) ||
                        verb.meaning.localizedCaseInsensitiveContains(searchText)
                    }
                }
                
                return filtered
            }
            .assign(to: &$filteredVerbs)
    }
    
    func selectCategory(_ category: VerbCategory?) {
        selectedCategory = category
    }
    
    private func loadMockVerbs() {
        verbs = [
            Verb(
                id: "1",
                baseForm: "be",
                thirdPerson: "is/are",
                pastSimple: "was/were",
                pastParticiple: "been",
                category: .irregular,
                meaning: "olmak",
                exampleSentence: "I am a student.",
                userProgress: .mastered
            ),
            Verb(
                id: "2",
                baseForm: "go",
                thirdPerson: "goes",
                pastSimple: "went",
                pastParticiple: "gone",
                category: .irregular,
                meaning: "gitmek",
                exampleSentence: "I go to school every day.",
                userProgress: .practiced
            ),
            Verb(
                id: "3",
                baseForm: "have",
                thirdPerson: "has",
                pastSimple: "had",
                pastParticiple: "had",
                category: .irregular,
                meaning: "sahip olmak",
                exampleSentence: "I have a car.",
                userProgress: .learning
            ),
            Verb(
                id: "4",
                baseForm: "work",
                thirdPerson: "works",
                pastSimple: "worked",
                pastParticiple: "worked",
                category: .regular,
                meaning: "çalışmak",
                exampleSentence: "I work at a company.",
                userProgress: .notLearned
            ),
            Verb(
                id: "5",
                baseForm: "give up",
                thirdPerson: "gives up",
                pastSimple: "gave up",
                pastParticiple: "given up",
                category: .phrasal,
                meaning: "pes etmek, vazgeçmek",
                exampleSentence: "Don't give up!",
                userProgress: .learning
            ),
            Verb(
                id: "6",
                baseForm: "can",
                thirdPerson: nil,
                pastSimple: "could",
                pastParticiple: "-",
                category: .modal,
                meaning: "-ebilmek (yetenek)",
                exampleSentence: "I can swim.",
                userProgress: .mastered
            )
        ]
        
        filteredVerbs = verbs
    }
}
