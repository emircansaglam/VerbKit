//
//  DailyGoalCard.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

//
//  DailyGoalCard.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI

struct DailyGoalCard: View {
    let currentProgress: Int
    let goal: Int
    let streak: Int
    
    private var progressPercentage: Double {
        Double(currentProgress) / Double(goal)
    }
    
    var body: some View {
        cardContainer
    }
}

// MARK: - Subviews
private extension DailyGoalCard {
    var cardContainer: some View {
        VStack(spacing: DesignSystem.Spacing.md) {
            headerSection
            progressRing
            streakSection
        }
        .padding(DesignSystem.Spacing.cardPadding)
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card))
        .shadow(
            color: DesignSystem.Shadow.md.color,
            radius: DesignSystem.Shadow.md.radius,
            y: DesignSystem.Shadow.md.y
        )
    }
    
    var cardBackground: some View {
        DesignSystem.Colors.cardGradient
    }
    
    var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text("Daily Goal")
                    .font(DesignSystem.Typography.title3)
                    .fontWeight(.semibold)
                
                Text("\(currentProgress) of \(goal) verbs")
                    .font(DesignSystem.Typography.subheadline)
                    .foregroundColor(DesignSystem.Colors.textSecondary)
            }
            Spacer()
        }
    }
    
    var progressRing: some View {
        ZStack {
            // Background circle
            Circle()
                .stroke(
                    DesignSystem.Colors.primary.opacity(0.2),
                    lineWidth: 12
                )
            
            // Progress circle
            Circle()
                .trim(from: 0, to: progressPercentage)
                .stroke(
                    DesignSystem.Colors.primaryGradient,
                    style: StrokeStyle(
                        lineWidth: 12,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.spring(duration: 1.0), value: progressPercentage)
            
            // Center content
            VStack(spacing: DesignSystem.Spacing.xs) {
                Text("\(currentProgress)")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundStyle(DesignSystem.Colors.primaryGradient)
                
                Text("verbs")
                    .font(DesignSystem.Typography.caption)
                    .foregroundColor(DesignSystem.Colors.textSecondary)
            }
        }
        .frame(width: 140, height: 140)
        .padding(.vertical, DesignSystem.Spacing.sm)
    }
    
    var streakSection: some View {
        HStack(spacing: DesignSystem.Spacing.sm) {
            Image(systemName: "flame.fill")
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color.orange, Color.red],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            Text("\(streak) day streak")
                .font(DesignSystem.Typography.subheadline)
                .fontWeight(.medium)
            
            Spacer()
            
            if currentProgress >= goal {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(DesignSystem.Colors.success)
                    .font(.title3)
            }
        }
        .padding(.horizontal, DesignSystem.Spacing.sm)
        .padding(.vertical, DesignSystem.Spacing.xs)
        .background(
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.sm)
                .fill(DesignSystem.Colors.primary.opacity(0.1))
        )
    }
}

#Preview {
    VStack {
        DailyGoalCard(currentProgress: 7, goal: 10, streak: 5)
        DailyGoalCard(currentProgress: 10, goal: 10, streak: 12)
    }
    .padding()
    .background(DesignSystem.Colors.background)
}
