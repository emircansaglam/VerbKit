//
//  MockVerbData.swift
//  VerbKit
//
//  Created by emircan.saglam on 13.02.2026.
//

import Foundation

struct MockVerbData {
    static let verbs: [Verb] = [
        Verb(
            id: "1",
            baseForm: "be",
            thirdPerson: "is/are",
            pastSimple: "was/were",
            pastParticiple: "been",
            category: .irregular,
            meaning: "olmak",
            level: .a1,
            exampleSentence: "I am a student."
        ),
        Verb(
            id: "2",
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
            id: "3",
            baseForm: "have",
            thirdPerson: "has",
            pastSimple: "had",
            pastParticiple: "had",
            category: .irregular,
            meaning: "sahip olmak",
            level: .a1,
            exampleSentence: "I have a car."
        ),
        Verb(
            id: "4",
            baseForm: "work",
            thirdPerson: "works",
            pastSimple: "worked",
            pastParticiple: "worked",
            category: .regular,
            meaning: "çalışmak",
            level: .a1,
            exampleSentence: "I work at a company."
        ),
        Verb(
            id: "5",
            baseForm: "give up",
            thirdPerson: "gives up",
            pastSimple: "gave up",
            pastParticiple: "given up",
            category: .phrasal,
            meaning: "pes etmek",
            level: .a2,
            exampleSentence: "Don't give up!"
        ),
        Verb(
            id: "6",
            baseForm: "can",
            thirdPerson: nil,
            pastSimple: "could",
            pastParticiple: "-",
            category: .modal,
            meaning: "-ebilmek",
            level: .a1,
            exampleSentence: "I can swim."
        ),
        Verb(
            id: "7",
            baseForm: "make",
            thirdPerson: "makes",
            pastSimple: "made",
            pastParticiple: "made",
            category: .irregular,
            meaning: "yapmak",
            level: .a1,
            exampleSentence: "I make breakfast every day."
        ),
        Verb(
            id: "8",
            baseForm: "take",
            thirdPerson: "takes",
            pastSimple: "took",
            pastParticiple: "taken",
            category: .irregular,
            meaning: "almak",
            level: .a1,
            exampleSentence: "Take your time."
        ),
        Verb(
            id: "9",
            baseForm: "come",
            thirdPerson: "comes",
            pastSimple: "came",
            pastParticiple: "come",
            category: .irregular,
            meaning: "gelmek",
            level: .a1,
            exampleSentence: "Come here please."
        ),
        Verb(
            id: "10",
            baseForm: "see",
            thirdPerson: "sees",
            pastSimple: "saw",
            pastParticiple: "seen",
            category: .irregular,
            meaning: "görmek",
            level: .a1,
            exampleSentence: "I see what you mean."
        ),
        Verb(
            id: "11",
            baseForm: "get",
            thirdPerson: "gets",
            pastSimple: "got",
            pastParticiple: "gotten",
            category: .irregular,
            meaning: "almak/olmak",
            level: .a1,
            exampleSentence: "Get ready!"
        ),
        Verb(
            id: "12",
            baseForm: "know",
            thirdPerson: "knows",
            pastSimple: "knew",
            pastParticiple: "known",
            category: .irregular,
            meaning: "bilmek",
            level: .a1,
            exampleSentence: "I know the answer."
        )
    ]
}
