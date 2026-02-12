//
//  CategoryCard.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI

struct CategoryCard: View {
    let category: HomeCategory
    
    var body: some View {
        cardContainer
    }
}

// MARK: - Subviews
private extension CategoryCard {
    var cardContainer: some View {
        VStack(spacing: DesignSystem.Spacing.sm) {
            iconSection
            titleSection
            progressSection
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
                category.color.opacity(0.15),
                category.color.opacity(0.05)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var iconSection: some View {
        Text(category.icon)
            .font(.system(size: 50))
    }
    
    var titleSection: some View {
        Text(category.name)
            .font(DesignSystem.Typography.callout)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    var progressSection: some View {
        VStack(spacing: DesignSystem.Spacing.xxs) {
            Text("\(Int(category.progress * 100))%")
                .font(DesignSystem.Typography.caption)
                .foregroundColor(category.color)
                .fontWeight(.medium)
            
            progressBar
        }
    }
    
    var progressBar: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(category.color.opacity(0.2))
                    .frame(height: 4)
                
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(category.color)
                    .frame(
                        width: geometry.size.width * category.progress,
                        height: 4
                    )
            }
        }
        .frame(height: 4)
    }
}

#Preview {
    LazyVGrid(
        columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ],
        spacing: 16
    ) {
        CategoryCard(
            category: HomeCategory(
                id: "1",
                name: "Regular Verbs",
                icon: "📚",
                color: .blue,
                progress: 0.45,
                totalVerbs: 100
            )
        )
        
        CategoryCard(
            category: HomeCategory(  // ✅ VerbCategory → HomeCategory
                id: "2",
                name: "Irregular Verbs",
                icon: "⚡",
                color: .purple,
                progress: 0.23,
                totalVerbs: 120
            )
        )
    }
    .padding()
    .background(DesignSystem.Colors.background)
}
