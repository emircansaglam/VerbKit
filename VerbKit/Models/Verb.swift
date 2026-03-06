//
//  Verb.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import Foundation
import SwiftUI

// MARK: - Verb Level

enum VerbLevel: String, Codable, CaseIterable, Identifiable {
    case a1 = "A1"
    case a2 = "A2"
    case b1 = "B1"
    case b2 = "B2"

    var id: String { rawValue }

    var color: Color {
        switch self {
        case .a1: return .green
        case .a2: return .blue
        case .b1: return .orange
        case .b2: return .red
        }
    }
}

// MARK: - Verb Category

enum VerbCategory: String, Codable, CaseIterable, Identifiable {
    case regular = "regular"
    case irregular = "irregular"
    case phrasal = "phrasal"
    case modal = "modal"

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .regular:   return "Regular"
        case .irregular: return "Irregular"
        case .phrasal:   return "Phrasal"
        case .modal:     return "Modal"
        }
    }

    var icon: String {
        switch self {
        case .regular:   return "📚"
        case .irregular: return "⚡"
        case .phrasal:   return "🔄"
        case .modal:     return "🎭"
        }
    }

    var color: Color {
        switch self {
        case .regular:   return .blue
        case .irregular: return .purple
        case .phrasal:   return .orange
        case .modal:     return .green
        }
    }
}

// MARK: - Verb Progress

enum VerbProgress: Int, Codable {
    case notLearned = 0
    case learning   = 1
    case practiced  = 2
    case mastered   = 3

    var stars: Int { rawValue }
}

// MARK: - Verb Model

struct Verb: Identifiable, Codable {
    let id: String
    let baseForm: String
    let thirdPerson: String?
    let pastSimple: String
    let pastParticiple: String
    let category: VerbCategory
    let meaning: String
    let level: VerbLevel
    let exampleSentence: String

    // Not in JSON — managed at runtime
    var userProgress: VerbProgress = .notLearned

    // MARK: Codable — exclude userProgress from JSON decoding
    enum CodingKeys: String, CodingKey {
        case id, baseForm, thirdPerson, pastSimple, pastParticiple
        case category, meaning, level, exampleSentence
    }
}
