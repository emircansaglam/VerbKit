//
//  QuizCard.swift
//  VerbKit
//
//  Created by emircan.saglam on 13.02.2026.
//

import SwiftUI

struct QuizCard: View {
    let question: QuizQuestion
    let answerState: AnswerState
    
    @State private var isVisible = false
    
    var body: some View {
        cardContainer
            .onAppear {
                withAnimation(.spring(duration: 0.5, bounce: 0.3)) {
                    isVisible = true
                }
            }
    }
}

// MARK: - Subviews
private extension QuizCard {
    var cardContainer: some View {
        VStack(spacing: DesignSystem.Spacing.md) {
            categoryBadge
            questionText
            verbHighlight
        }
        .frame(maxWidth: .infinity)
        .padding(DesignSystem.Spacing.xl)
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xxl))
        .shadow(
            color: DesignSystem.Shadow.md.color,
            radius: DesignSystem.Shadow.md.radius,
            y: DesignSystem.Shadow.md.y
        )
        .scaleEffect(isVisible ? 1 : 0.8)
        .opacity(isVisible ? 1 : 0)
    }
    
    var cardBackground: some View {
        LinearGradient(
            colors: [
                question.verb.category.color.opacity(0.15),
                question.verb.category.color.opacity(0.05)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var categoryBadge: some View {
        HStack {
            Text(question.verb.category.icon)
                .font(.title3)
            
            Text(question.verb.category.rawValue)
                .font(DesignSystem.Typography.caption)
                .fontWeight(.semibold)
                .foregroundColor(question.verb.category.color)
        }
        .padding(.horizontal, DesignSystem.Spacing.md)
        .padding(.vertical, DesignSystem.Spacing.xs)
        .background(question.verb.category.color.opacity(0.15))
        .clipShape(Capsule())
    }
    
    var questionText: some View {
        Text(question.type.questionText(for: question.verb))
            .font(DesignSystem.Typography.title3)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .foregroundColor(DesignSystem.Colors.textPrimary)
    }
    
    var verbHighlight: some View {
        Text(highlightedWord)
            .font(DesignSystem.Typography.title2)
            .fontWeight(.bold)
            .foregroundStyle(DesignSystem.Colors.primaryGradient)
    }
    
    var highlightedWord: String {
        switch question.type {
        case .baseFromPast: return question.verb.pastSimple
        case .pastFromBase: return question.verb.baseForm
        case .participleFromBase: return question.verb.baseForm
        case .meaningFromBase: return question.verb.baseForm
        }
    }
}

#Preview {
    QuizCard(
        question: QuizQuestion(
            verb: MockVerbData.verbs[1],
            type: .pastFromBase,
            options: ["went", "goed", "gone", "going"],
            correctAnswer: "went"
        ),
        answerState: .idle
    )
    .padding()
    .background(DesignSystem.Colors.background)
}
