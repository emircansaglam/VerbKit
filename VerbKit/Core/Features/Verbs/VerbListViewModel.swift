//
//  VerbListViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

//
//  VerbListViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI

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
    
    init() {
        loadMockVerbs()
    }
    
    func selectCategory(_ category: VerbCategory?) {
        selectedCategory = category
    }
    
    private func applyFilters() {
        var filtered = verbs
        
        if let category = selectedCategory {
            filtered = filtered.filter { $0.category == category }
        }
        
        if !searchText.isEmpty {
            filtered = filtered.filter { verb in
                verb.baseForm.localizedCaseInsensitiveContains(searchText) ||
                verb.meaning.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        filteredVerbs = filtered
    }
    
    private func loadMockVerbs() {
        verbs = MockVerbData.verbs
        filteredVerbs = verbs
    }
}
