//
//  AnswerButton.swift
//  VerbKit
//
//  Created by emircan.saglam on 13.02.2026.
//

import SwiftUI

struct AnswerButton: View {
    let option: String
    let answerState: AnswerState
    let selectedAnswer: String?
    let correctAnswer: String
    let onTap: () -> Void
    
    @State private var isPressed = false
    @State private var shake = false
    
    private var buttonState: ButtonAppearance {
        guard let selected = selectedAnswer else { return .idle }
        
        if option == correctAnswer {
            return .correct
        } else if option == selected {
            return .wrong
        } else {
            return .dimmed
        }
    }
    
    var body: some View {
        Button {
            guard answerState == .idle else { return }
            handleTap()
        } label: {
            buttonLabel
        }
        .buttonStyle(.plain)
        .shake(shake)
        .onChange(of: answerState) {
            if answerState == .wrong && selectedAnswer == option {
                withAnimation(.spring(duration: 0.4)) {
                    shake = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    shake = false
                }
            }
        }
    }
}

// MARK: - Appearance
private extension AnswerButton {
    enum ButtonAppearance {
        case idle
        case correct
        case wrong
        case dimmed
    }
    
    var buttonLabel: some View {
        HStack {
            Text(option)
                .font(DesignSystem.Typography.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(labelColor)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            stateIcon
        }
        .padding(.horizontal, DesignSystem.Spacing.md)
        .padding(.vertical, DesignSystem.Spacing.md)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg))
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                .stroke(borderColor, lineWidth: 2)
        )
        .scaleEffect(isPressed ? 0.96 : 1)
        .animation(.spring(duration: 0.2), value: isPressed)
        .scaleEffect(buttonState == .correct ? 1.02 : 1)
        .animation(.spring(duration: 0.3, bounce: 0.4), value: buttonState == .correct)
    }
    
    @ViewBuilder
    var stateIcon: some View {
        switch buttonState {
        case .correct:
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(DesignSystem.Colors.success)
                .font(.title3)
                .transition(.scale.combined(with: .opacity))
        case .wrong:
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(DesignSystem.Colors.error)
                .font(.title3)
                .transition(.scale.combined(with: .opacity))
        default:
            EmptyView()
        }
    }
    
    var backgroundColor: Color {
        switch buttonState {
        case .idle: return Color.white
        case .correct: return DesignSystem.Colors.success.opacity(0.15)
        case .wrong: return DesignSystem.Colors.error.opacity(0.15)
        case .dimmed: return Color.white.opacity(0.5)
        }
    }
    
    var borderColor: Color {
        switch buttonState {
        case .idle: return Color.gray.opacity(0.2)
        case .correct: return DesignSystem.Colors.success
        case .wrong: return DesignSystem.Colors.error
        case .dimmed: return Color.gray.opacity(0.1)
        }
    }
    
    var labelColor: Color {
        switch buttonState {
        case .idle: return DesignSystem.Colors.textPrimary
        case .correct: return DesignSystem.Colors.success
        case .wrong: return DesignSystem.Colors.error
        case .dimmed: return DesignSystem.Colors.textSecondary
        }
    }
    
    func handleTap() {
        withAnimation(.spring(duration: 0.1)) { isPressed = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.spring(duration: 0.1)) { isPressed = false }
        }
        onTap()
    }
}

#Preview {
    VStack(spacing: 12) {
        AnswerButton(option: "go", answerState: .idle, selectedAnswer: nil, correctAnswer: "go") {}
        AnswerButton(option: "go", answerState: .correct, selectedAnswer: "go", correctAnswer: "go") {}
        AnswerButton(option: "get", answerState: .wrong, selectedAnswer: "get", correctAnswer: "go") {}
        AnswerButton(option: "give", answerState: .wrong, selectedAnswer: "get", correctAnswer: "go") {}
    }
    .padding()
    .background(DesignSystem.Colors.background)
}
