//
//  VerbListViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI
import SwiftData

@Observable
final class VerbListViewModel {
    var verbs: [Verb] = []
    var filteredVerbs: [Verb] = []
    var searchText: String = "" {
        didSet { applyFilters() }
    }
    var selectedCategory: VerbCategory? {
        didSet { applyFilters() }
    }

    private let repository: any VerbRepositoryProtocol

    init(repository: any VerbRepositoryProtocol = VerbRepository()) {
        self.repository = repository
        loadVerbs()
    }

    func loadVerbs() {
        verbs = repository.fetchVerbs(
            category: selectedCategory,
            level: nil,
            search: searchText
        )
        filteredVerbs = verbs
    }

    func selectCategory(_ category: VerbCategory?) {
        selectedCategory = category
    }

    private func applyFilters() {
        filteredVerbs = repository.fetchVerbs(
            category: selectedCategory,
            level: nil,
            search: searchText
        )
    }
}
