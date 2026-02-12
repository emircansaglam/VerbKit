//
//  ContinueLearningCard.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI

struct ContinueLearningCard: View {
    let category: HomeCategory
    
    var body: some View {
        cardContainer
    }
}

// MARK: - Subviews
private extension ContinueLearningCard {
    var cardContainer: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            iconSection
            contentSection
            Spacer()
            arrowIcon
        }
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
                category.color.opacity(0.1),
                category.color.opacity(0.05)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var iconSection: some View {
        Text(category.icon)
            .font(.system(size: 40))
            .frame(width: 60, height: 60)
            .background(
                Circle()
                    .fill(category.color.opacity(0.2))
            )
    }
    
    var contentSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
            Text(category.name)
                .font(DesignSystem.Typography.body)
                .fontWeight(.semibold)
            
            progressBar
            
            Text("\(Int(category.progress * 100))% complete")
                .font(DesignSystem.Typography.caption)
                .foregroundColor(DesignSystem.Colors.textSecondary)
        }
    }
    
    var progressBar: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(category.color.opacity(0.2))
                    .frame(height: 6)
                
                // Progress
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(category.color)
                    .frame(
                        width: geometry.size.width * category.progress,
                        height: 6
                    )
            }
        }
        .frame(height: 6)
    }
    
    var arrowIcon: some View {
        Image(systemName: "chevron.right")
            .foregroundColor(DesignSystem.Colors.textSecondary)
            .font(.callout)
    }
}

#Preview {
    ContinueLearningCard(
        category: HomeCategory(
            id: "1",
            name: "Regular Verbs",
            icon: "📚",
            color: .blue,
            progress: 0.45,
            totalVerbs: 100
        )
    )
    .padding()
    .background(DesignSystem.Colors.background)
}
