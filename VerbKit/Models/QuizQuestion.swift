//
//  QuizQuestion.swift
//  VerbKit
//
//  Created by emircan.saglam on 13.02.2026.
//

import Foundation

enum QuestionType: CaseIterable {
    case baseFromPast
    case pastFromBase
    case participleFromBase
    case meaningFromBase
    
    func questionText(for verb: Verb) -> String {
        switch self {
        case .baseFromPast:        return "'\(verb.pastSimple)' — what is the base form?"
        case .pastFromBase:        return "'\(verb.baseForm)' — what is the past simple?"
        case .participleFromBase:  return "'\(verb.baseForm)' — what is the past participle?"
        case .meaningFromBase:     return "'\(verb.baseForm)' — what does it mean?"
        }
    }
    
    func correctAnswer(for verb: Verb) -> String {
        switch self {
        case .baseFromPast:        return verb.baseForm
        case .pastFromBase:        return verb.pastSimple
        case .participleFromBase:  return verb.pastParticiple
        case .meaningFromBase:     return verb.meaning
        }
    }
}

struct QuizQuestion: Identifiable {
    let id = UUID()
    let verb: Verb
    let type: QuestionType
    let options: [String]
    let correctAnswer: String
}

enum AnswerState {
    case idle
    case correct
    case wrong
}

enum QuizPhase {
    case idle
    case playing
    case finished
}
