//
//  MockVerbData.swift
//  VerbKit
//
//  Created by emircan.saglam on 13.02.2026.
//

import Foundation

struct MockVerbData {
    static let verbs: [Verb] = [
        Verb(id: "1", baseForm: "be", thirdPerson: "is/are", pastSimple: "was/were", pastParticiple: "been", category: .irregular, meaning: "olmak", exampleSentence: "I am a student.", userProgress: .mastered),
        Verb(id: "2", baseForm: "go", thirdPerson: "goes", pastSimple: "went", pastParticiple: "gone", category: .irregular, meaning: "gitmek", exampleSentence: "I go to school every day.", userProgress: .practiced),
        Verb(id: "3", baseForm: "have", thirdPerson: "has", pastSimple: "had", pastParticiple: "had", category: .irregular, meaning: "sahip olmak", exampleSentence: "I have a car.", userProgress: .learning),
        Verb(id: "4", baseForm: "work", thirdPerson: "works", pastSimple: "worked", pastParticiple: "worked", category: .regular, meaning: "çalışmak", exampleSentence: "I work at a company.", userProgress: .notLearned),
        Verb(id: "5", baseForm: "give up", thirdPerson: "gives up", pastSimple: "gave up", pastParticiple: "given up", category: .phrasal, meaning: "pes etmek", exampleSentence: "Don't give up!", userProgress: .learning),
        Verb(id: "6", baseForm: "can", thirdPerson: nil, pastSimple: "could", pastParticiple: "-", category: .modal, meaning: "-ebilmek", exampleSentence: "I can swim.", userProgress: .mastered),
        Verb(id: "7", baseForm: "make", thirdPerson: "makes", pastSimple: "made", pastParticiple: "made", category: .irregular, meaning: "yapmak", exampleSentence: "I make breakfast every day.", userProgress: .notLearned),
        Verb(id: "8", baseForm: "take", thirdPerson: "takes", pastSimple: "took", pastParticiple: "taken", category: .irregular, meaning: "almak", exampleSentence: "Take your time.", userProgress: .notLearned),
        Verb(id: "9", baseForm: "come", thirdPerson: "comes", pastSimple: "came", pastParticiple: "come", category: .irregular, meaning: "gelmek", exampleSentence: "Come here please.", userProgress: .notLearned),
        Verb(id: "10", baseForm: "see", thirdPerson: "sees", pastSimple: "saw", pastParticiple: "seen", category: .irregular, meaning: "görmek", exampleSentence: "I see what you mean.", userProgress: .notLearned),
        Verb(id: "11", baseForm: "get", thirdPerson: "gets", pastSimple: "got", pastParticiple: "gotten", category: .irregular, meaning: "almak/olmak", exampleSentence: "Get ready!", userProgress: .notLearned),
        Verb(id: "12", baseForm: "know", thirdPerson: "knows", pastSimple: "knew", pastParticiple: "known", category: .irregular, meaning: "bilmek", exampleSentence: "I know the answer.", userProgress: .notLearned)
    ]
}
