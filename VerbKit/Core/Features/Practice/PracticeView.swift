//
//  PracticeView.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

struct PracticeView: View {
    @State private var viewModel = PracticeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                DesignSystem.Colors.background
                    .ignoresSafeArea()
                
                switch viewModel.phase {
                case .idle:
                    idleView
                        .transition(.opacity)
                case .playing:
                    QuizSessionView(viewModel: viewModel)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                case .finished:
                    ResultView(viewModel: viewModel)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)
                        ))
                }
            }
            .animation(.spring(duration: 0.4), value: viewModel.phase)
            .verbKitNavigationBar(title: "Practice")
        }
        .padding(.bottom, DesignSystem.Spacing.xxxl)
    }
}

// MARK: - Idle View
private extension PracticeView {
    var idleView: some View {
        VStack(spacing: DesignSystem.Spacing.xl) {
            Spacer()
            
            mascotSection
            titleSection
            bestScoreSection
            
            Spacer()
            
            startButton
        }
        .padding(.horizontal, DesignSystem.Spacing.screenEdge)
        .padding(.bottom, DesignSystem.Spacing.xl)
    }
    
    var mascotSection: some View {
        Text("🎮")
            .font(.system(size: 80))
    }
    
    var titleSection: some View {
        VStack(spacing: DesignSystem.Spacing.sm) {
            Text("Verb Challenge")
                .font(DesignSystem.Typography.largeTitle)
                .fontWeight(.bold)
            
            Text("Answer 10 questions,\nearn as many points as you can!")
                .font(DesignSystem.Typography.subheadline)
                .foregroundColor(DesignSystem.Colors.textSecondary)
                .multilineTextAlignment(.center)
        }
    }
    
    var bestScoreSection: some View {
        HStack(spacing: DesignSystem.Spacing.xs) {
            Image(systemName: "trophy.fill")
                .foregroundColor(.yellow)
            
            Text("Best Score: \(viewModel.bestScore)")
                .font(DesignSystem.Typography.subheadline)
                .fontWeight(.semibold)
        }
        .padding(.horizontal, DesignSystem.Spacing.lg)
        .padding(.vertical, DesignSystem.Spacing.sm)
        .background(Color.yellow.opacity(0.15))
        .clipShape(Capsule())
    }
    
    var startButton: some View {
        Button {
            viewModel.startQuiz()
        } label: {
            HStack(spacing: DesignSystem.Spacing.sm) {
                Image(systemName: "play.fill")
                Text("Start Quiz")
                    .fontWeight(.bold)
            }
            .font(DesignSystem.Typography.body)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(DesignSystem.Spacing.md)
            .background(DesignSystem.Colors.primaryGradient)
            .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.button))
            .shadow(
                color: DesignSystem.Shadow.primaryGlow.color,
                radius: DesignSystem.Shadow.primaryGlow.radius,
                y: DesignSystem.Shadow.primaryGlow.y
            )
        }
    }
}

#Preview {
    PracticeView()
}
