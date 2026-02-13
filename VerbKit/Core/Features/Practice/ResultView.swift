//
//  ResultView.swift
//  VerbKit
//
//  Created by emircan.saglam on 13.02.2026.
//

import SwiftUI

struct ResultView: View {
    @Bindable var viewModel: PracticeViewModel
    
    @State private var isVisible = false
    @State private var showStats = false
    @State private var showButtons = false
    
    private var isNewBest: Bool {
        viewModel.score == viewModel.bestScore && viewModel.score > 0
    }
    
    private var resultEmoji: String {
        let accuracy = Double(viewModel.correctCount) / Double(viewModel.questions.count)
        switch accuracy {
        case 0.9...: return "🏆"
        case 0.7..<0.9: return "🌟"
        case 0.5..<0.7: return "👍"
        default: return "💪"
        }
    }
    
    private var resultMessage: String {
        let accuracy = Double(viewModel.correctCount) / Double(viewModel.questions.count)
        switch accuracy {
        case 0.9...: return "Outstanding!"
        case 0.7..<0.9: return "Great job!"
        case 0.5..<0.7: return "Good effort!"
        default: return "Keep practicing!"
        }
    }
    
    var body: some View {
        ZStack {
            DesignSystem.Colors.background
                .ignoresSafeArea()
            
            VStack(spacing: DesignSystem.Spacing.xl) {
                Spacer()
                
                emojiSection
                titleSection
                
                if showStats {
                    statsSection
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                Spacer()
                
                if showButtons {
                    buttonsSection
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .padding(.horizontal, DesignSystem.Spacing.screenEdge)
            .padding(.bottom, DesignSystem.Spacing.xl)
        }
        .onAppear {
            animateIn()
        }
    }
}

// MARK: - Subviews
private extension ResultView {
    var emojiSection: some View {
        Text(resultEmoji)
            .font(.system(size: 80))
            .scaleEffect(isVisible ? 1 : 0.3)
            .opacity(isVisible ? 1 : 0)
            .animation(.spring(duration: 0.6, bounce: 0.5), value: isVisible)
    }
    
    var titleSection: some View {
        VStack(spacing: DesignSystem.Spacing.sm) {
            Text(resultMessage)
                .font(DesignSystem.Typography.largeTitle)
                .fontWeight(.bold)
                .opacity(isVisible ? 1 : 0)
                .animation(.easeIn(duration: 0.4).delay(0.3), value: isVisible)
            
            if isNewBest {
                HStack(spacing: DesignSystem.Spacing.xs) {
                    Image(systemName: "trophy.fill")
                        .foregroundColor(.yellow)
                    
                    Text("New Best Score!")
                        .font(DesignSystem.Typography.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.yellow)
                }
                .padding(.horizontal, DesignSystem.Spacing.md)
                .padding(.vertical, DesignSystem.Spacing.xs)
                .background(Color.yellow.opacity(0.15))
                .clipShape(Capsule())
                .opacity(isVisible ? 1 : 0)
                .animation(.spring(duration: 0.4).delay(0.5), value: isVisible)
            }
        }
    }
    
    var statsSection: some View {
        VStack(spacing: DesignSystem.Spacing.md) {
            statRow(
                icon: "star.fill",
                color: .yellow,
                title: "Score",
                value: "\(viewModel.score)"
            )
            statRow(
                icon: "checkmark.circle.fill",
                color: DesignSystem.Colors.success,
                title: "Correct",
                value: "\(viewModel.correctCount)/\(viewModel.questions.count)"
            )
            statRow(
                icon: "flame.fill",
                color: .orange,
                title: "Best Streak",
                value: "\(viewModel.bestStreak)"
            )
            statRow(
                icon: "trophy.fill",
                color: .yellow,
                title: "Best Score",
                value: "\(viewModel.bestScore)"
            )
        }
        .padding(DesignSystem.Spacing.cardPadding)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card))
        .shadow(
            color: DesignSystem.Shadow.sm.color,
            radius: DesignSystem.Shadow.sm.radius,
            y: DesignSystem.Shadow.sm.y
        )
    }
    
    func statRow(icon: String, color: Color, title: String, value: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 24)
            
            Text(title)
                .font(DesignSystem.Typography.subheadline)
                .foregroundColor(DesignSystem.Colors.textSecondary)
            
            Spacer()
            
            Text(value)
                .font(DesignSystem.Typography.subheadline)
                .fontWeight(.bold)
        }
    }
    
    var buttonsSection: some View {
        VStack(spacing: DesignSystem.Spacing.sm) {
            Button {
                viewModel.startQuiz()
            } label: {
                Text("Play Again")
                    .font(DesignSystem.Typography.bodyBold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(DesignSystem.Spacing.md)
                    .background(DesignSystem.Colors.primaryGradient)
                    .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.button))
            }
            
            Button {
                viewModel.restartQuiz()
            } label: {
                Text("Back to Practice")
                    .font(DesignSystem.Typography.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(DesignSystem.Colors.primary)
                    .frame(maxWidth: .infinity)
                    .padding(DesignSystem.Spacing.md)
                    .background(DesignSystem.Colors.primary.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.button))
            }
        }
    }
}

// MARK: - Animations
private extension ResultView {
    func animateIn() {
        withAnimation { isVisible = true }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.spring(duration: 0.5, bounce: 0.3)) {
                showStats = true
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(.spring(duration: 0.5, bounce: 0.3)) {
                showButtons = true
            }
        }
    }
}

#Preview {
    let vm = PracticeViewModel()
    vm.startQuiz()
    return ResultView(viewModel: vm)
}
