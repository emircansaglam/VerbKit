//
//  Verb.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import Foundation

import SwiftUI

struct Verb: Identifiable {
    let id: String
    let baseForm: String           // "go"
    let thirdPerson: String?       // "goes" (optional for modals)
    let pastSimple: String         // "went"
    let pastParticiple: String     // "gone"
    let category: VerbCategory
    let meaning: String            // Turkish meaning
    let exampleSentence: String
    let userProgress: VerbProgress // 0-3 stars
}

enum VerbCategory: String, CaseIterable, Identifiable {
    case regular = "Regular"
    case irregular = "Irregular"
    case phrasal = "Phrasal"
    case modal = "Modal"
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .regular: return "📚"
        case .irregular: return "⚡"
        case .phrasal: return "🔄"
        case .modal: return "🎭"
        }
    }
    
    var color: Color {
        switch self {
        case .regular: return .blue
        case .irregular: return .purple
        case .phrasal: return .orange
        case .modal: return .green
        }
    }
}

enum VerbProgress: Int {
    case notLearned = 0
    case learning = 1
    case practiced = 2
    case mastered = 3
    
    var stars: Int { rawValue }
}
