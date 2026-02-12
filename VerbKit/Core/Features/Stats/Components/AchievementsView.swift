//
//  AchievementsView.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI

struct AchievementsView: View {
    let achievements: [Achievement]
    
    var body: some View {
        cardContainer
    }
}

// MARK: - Subviews
private extension AchievementsView {
    var cardContainer: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            headerSection
            achievementsGrid
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
    
    var headerSection: some View {
        HStack {
            Text("Achievements")
                .font(DesignSystem.Typography.title3)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text("\(achievements.filter { $0.isUnlocked }.count)/\(achievements.count)")
                .font(DesignSystem.Typography.caption)
                .foregroundColor(DesignSystem.Colors.textSecondary)
        }
    }
    
    var achievementsGrid: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ],
            spacing: DesignSystem.Spacing.md
        ) {
            ForEach(achievements) { achievement in
                achievementItem(for: achievement)
            }
        }
    }
    
    func achievementItem(for achievement: Achievement) -> some View {
        VStack(spacing: DesignSystem.Spacing.xs) {
            ZStack {
                Circle()
                    .fill(
                        achievement.isUnlocked
                            ? DesignSystem.Colors.primary.opacity(0.15)
                            : Color.gray.opacity(0.1)
                    )
                    .frame(width: 56, height: 56)
                
                Text(achievement.icon)
                    .font(.system(size: 28))
                    .opacity(achievement.isUnlocked ? 1 : 0.3)
                
                if !achievement.isUnlocked {
                    Image(systemName: "lock.fill")
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .offset(x: 16, y: 16)
                }
            }
            
            Text(achievement.title)
                .font(DesignSystem.Typography.caption2)
                .fontWeight(.medium)
                .foregroundColor(
                    achievement.isUnlocked
                        ? DesignSystem.Colors.textPrimary
                        : DesignSystem.Colors.textSecondary
                )
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
    }
}

#Preview {
    AchievementsView(achievements: [
        Achievement(id: "1", title: "First Verb", description: "Learn your first verb", icon: "🌱", isUnlocked: true),
        Achievement(id: "2", title: "On Fire!", description: "7 day streak", icon: "🔥", isUnlocked: false),
        Achievement(id: "3", title: "Bookworm", description: "Learn 50 verbs", icon: "📚", isUnlocked: false)
    ])
    .padding()
    .background(DesignSystem.Colors.background)
}
