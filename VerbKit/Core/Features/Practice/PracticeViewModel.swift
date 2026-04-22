//
//  PracticeViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 13.02.2026.
//

import SwiftUI

@Observable
final class PracticeViewModel {
    // Quiz state
    var phase: QuizPhase = .idle
    var questions: [QuizQuestion] = []
    var currentIndex: Int = 0
    var selectedAnswer: String? = nil
    var answerState: AnswerState = .idle
    
    // Score
    var score: Int = 0
    var correctCount: Int = 0
    var bestStreak: Int = 0
    var currentStreak: Int = 0
    var bestScore: Int = UserDefaults.standard.integer(forKey: "bestScore")
    
    // Timer
    var timeRemaining: Double = 10.0
    var timerProgress: Double = 1.0
    private var timerTask: Task<Void, Never>?
    
    var currentQuestion: QuizQuestion? {
        guard currentIndex < questions.count else { return nil }
        return questions[currentIndex]
    }
    
    var progress: Double {
        guard !questions.isEmpty else { return 0 }
        return Double(currentIndex) / Double(questions.count)
    }
    
    var isLastQuestion: Bool {
        currentIndex == questions.count - 1
    }
    
    // MARK: - Actions
    
    func startQuiz() {
        questions = generateQuestions()
        currentIndex = 0
        score = 0
        correctCount = 0
        bestStreak = 0
        currentStreak = 0
        selectedAnswer = nil
        answerState = .idle
        phase = .playing
        startTimer()
    }
    
    func selectAnswer(_ answer: String) {
        guard answerState == .idle, let question = currentQuestion else { return }
        
        stopTimer()
        selectedAnswer = answer
        
        if answer == question.correctAnswer {
            answerState = .correct
            correctCount += 1
            currentStreak += 1
            bestStreak = max(bestStreak, currentStreak)
            
            let points: Int
            switch timeRemaining {
            case 7...: points = 15
            case 4..<7: points = 10
            default: points = 5
            }
            score += points
        } else {
            answerState = .wrong
            currentStreak = 0
        }
        
        Task {
            try? await Task.sleep(for: .seconds(1.2))
            await MainActor.run {
                advanceQuestion()
            }
        }
    }
    
    func restartQuiz() {
        phase = .idle
    }
    
    // MARK: - Private
    
    private func advanceQuestion() {
        if isLastQuestion {
            finishQuiz()
        } else {
            currentIndex += 1
            selectedAnswer = nil
            answerState = .idle
            startTimer()
        }
    }
    
    private func finishQuiz() {
        stopTimer()
        phase = .finished
        
        if score > bestScore {
            bestScore = score
            UserDefaults.standard.set(bestScore, forKey: "bestScore")
        }
    }
    
    private func startTimer() {
        timeRemaining = 10.0
        timerProgress = 1.0
        
        timerTask = Task {
            while timeRemaining > 0 {
                try? await Task.sleep(for: .milliseconds(100))
                await MainActor.run {
                    timeRemaining = max(0, timeRemaining - 0.1)
                    timerProgress = timeRemaining / 10.0
                }
            }
            await MainActor.run {
                if answerState == .idle {
                    handleTimeOut()
                }
            }
        }
    }
    
    private func stopTimer() {
        timerTask?.cancel()
        timerTask = nil
    }
    
    private func handleTimeOut() {
        answerState = .wrong
        currentStreak = 0
        
        Task {
            try? await Task.sleep(for: .seconds(1.2))
            await MainActor.run {
                advanceQuestion()
            }
        }
    }
    
    // MARK: - Question Generation
    
    private func generateQuestions() -> [QuizQuestion] {
        let allVerbs = VerbRepository().fetchVerbs(category: nil, level: nil, search: "")
        let selectedVerbs = Array(allVerbs.shuffled().prefix(10))
        
        return selectedVerbs.map { verb in
            let type = QuestionType.allCases.randomElement()!
            let correctAnswer = type.correctAnswer(for: verb)
            let wrongOptions = generateWrongOptions(
                for: verb,
                type: type,
                correctAnswer: correctAnswer,
                allVerbs: allVerbs
            )
            let options = (wrongOptions + [correctAnswer]).shuffled()
            
            return QuizQuestion(
                verb: verb,
                type: type,
                options: options,
                correctAnswer: correctAnswer
            )
        }
    }
    
    private func generateWrongOptions(
        for verb: Verb,
        type: QuestionType,
        correctAnswer: String,
        allVerbs: [Verb]
    ) -> [String] {
        let otherVerbs = allVerbs.filter { $0.id != verb.id }
        let wrongAnswers = otherVerbs
            .map { type.correctAnswer(for: $0) }
            .filter { $0 != correctAnswer }
            .shuffled()
        
        return Array(wrongAnswers.prefix(3))
    }
}
