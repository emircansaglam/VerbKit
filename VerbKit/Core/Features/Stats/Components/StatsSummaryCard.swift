//
//  StatsSummaryCard.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI

struct StatsSummaryCard: View {
    let icon: String
    let value: String
    let title: String
    let color: Color
    
    var body: some View {
        cardContainer
    }
}

// MARK: - Subviews
private extension StatsSummaryCard {
    var cardContainer: some View {
        VStack(spacing: DesignSystem.Spacing.sm) {
            iconSection
            valueSection
            titleSection
        }
        .frame(maxWidth: .infinity)
        .padding(DesignSystem.Spacing.cardPadding)
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card))
        .shadow(
            color: DesignSystem.Shadow.sm.color,
            radius: DesignSystem.Shadow.sm.radius,
            y: DesignSystem.Shadow.sm.y
        )
    }
    
    var cardBackground: some View {
        LinearGradient(
            colors: [
                color.opacity(0.15),
                color.opacity(0.05)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var iconSection: some View {
        Text(icon)
            .font(.system(size: 32))
    }
    
    var valueSection: some View {
        Text(value)
            .font(DesignSystem.Typography.title2)
            .fontWeight(.bold)
            .foregroundColor(color)
    }
    
    var titleSection: some View {
        Text(title)
            .font(DesignSystem.Typography.caption)
            .foregroundColor(DesignSystem.Colors.textSecondary)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    HStack {
        StatsSummaryCard(icon: "🔥", value: "5", title: "Day Streak", color: .orange)
        StatsSummaryCard(icon: "📚", value: "45", title: "Total Learned", color: .blue)
        StatsSummaryCard(icon: "⭐", value: "12", title: "Mastered", color: .yellow)
    }
    .padding()
    .background(DesignSystem.Colors.background)
}
