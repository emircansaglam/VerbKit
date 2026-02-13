//
//  QuizSessionView.swift
//  VerbKit
//
//  Created by emircan.saglam on 13.02.2026.
//

import SwiftUI

struct QuizSessionView: View {
    @Bindable var viewModel: PracticeViewModel
    
    @State private var questionOffset: CGFloat = 0
    @State private var questionOpacity: Double = 1
    
    var body: some View {
        ZStack {
            DesignSystem.Colors.background
                .ignoresSafeArea()
            
            VStack(spacing: DesignSystem.Spacing.lg) {
                headerSection
                timerSection
                questionSection
                answersSection
                Spacer()
            }
            .padding(.horizontal, DesignSystem.Spacing.screenEdge)
            .padding(.top, DesignSystem.Spacing.md)
        }
        .onChange(of: viewModel.currentIndex) {
            animateQuestionTransition()
        }
    }
}

// MARK: - Subviews
private extension QuizSessionView {
    var headerSection: some View {
        HStack {
            scoreView
            Spacer()
            progressView
        }
    }
    
    var scoreView: some View {
        HStack(spacing: DesignSystem.Spacing.xs) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.subheadline)
            
            Text("\(viewModel.score)")
                .font(DesignSystem.Typography.title3)
                .fontWeight(.bold)
                .contentTransition(.numericText())
                .animation(.spring(duration: 0.3), value: viewModel.score)
        }
        .padding(.horizontal, DesignSystem.Spacing.md)
        .padding(.vertical, DesignSystem.Spacing.sm)
        .background(Color.yellow.opacity(0.15))
        .clipShape(Capsule())
    }
    
    var progressView: some View {
        Text("\(viewModel.currentIndex + 1) / \(viewModel.questions.count)")
            .font(DesignSystem.Typography.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(DesignSystem.Colors.textSecondary)
    }
    
    var timerSection: some View {
        VStack(spacing: DesignSystem.Spacing.xs) {
            TimerBar(
                progress: viewModel.timerProgress,
                timeRemaining: viewModel.timeRemaining
            )
            
            HStack {
                Spacer()
                Text(String(format: "%.0f", viewModel.timeRemaining))
                    .font(DesignSystem.Typography.caption)
                    .foregroundColor(timerColor)
                    .fontWeight(.semibold)
                    .contentTransition(.numericText())
                    .animation(.linear(duration: 0.1), value: viewModel.timeRemaining)
            }
        }
    }
    
    var timerColor: Color {
        switch viewModel.timeRemaining {
        case 6...: return DesignSystem.Colors.primary
        case 3..<6: return DesignSystem.Colors.warning
        default: return DesignSystem.Colors.error
        }
    }
    
    var questionSection: some View {
        Group {
            if let question = viewModel.currentQuestion {
                QuizCard(
                    question: question,
                    answerState: viewModel.answerState
                )
                .offset(x: questionOffset)
                .opacity(questionOpacity)
            }
        }
    }
    
    var answersSection: some View {
        Group {
            if let question = viewModel.currentQuestion {
                VStack(spacing: DesignSystem.Spacing.sm) {
                    ForEach(question.options, id: \.self) { option in
                        AnswerButton(
                            option: option,
                            answerState: viewModel.answerState,
                            selectedAnswer: viewModel.selectedAnswer,
                            correctAnswer: question.correctAnswer
                        ) {
                            viewModel.selectAnswer(option)
                        }
                    }
                }
                .offset(x: questionOffset)
                .opacity(questionOpacity)
            }
        }
    }
}

// MARK: - Animations
private extension QuizSessionView {
    func animateQuestionTransition() {
        // Slide out
        withAnimation(.easeIn(duration: 0.2)) {
            questionOffset = -50
            questionOpacity = 0
        }
        
        // Slide in from right
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            questionOffset = 50
            withAnimation(.spring(duration: 0.4, bounce: 0.3)) {
                questionOffset = 0
                questionOpacity = 1
            }
        }
    }
}

#Preview {
    let vm = PracticeViewModel()
    vm.startQuiz()
    return QuizSessionView(viewModel: vm)
}
