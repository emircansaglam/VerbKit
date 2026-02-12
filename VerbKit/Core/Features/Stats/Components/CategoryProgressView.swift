//
//  CategoryProgressView.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI

struct CategoryProgressView: View {
    let categories: [CategoryProgress]
    
    var body: some View {
        cardContainer
    }
}

// MARK: - Subviews
private extension CategoryProgressView {
    var cardContainer: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            headerSection
            progressList
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
        Text("Category Progress")
            .font(DesignSystem.Typography.title3)
            .fontWeight(.semibold)
    }
    
    var progressList: some View {
        VStack(spacing: DesignSystem.Spacing.md) {
            ForEach(categories) { category in
                categoryRow(for: category)
            }
        }
    }
    
    func categoryRow(for category: CategoryProgress) -> some View {
        VStack(spacing: DesignSystem.Spacing.xs) {
            HStack {
                Text(category.icon)
                    .font(.body)
                
                Text(category.name)
                    .font(DesignSystem.Typography.subheadline)
                    .fontWeight(.medium)
                
                Spacer()
                
                Text("\(category.learned)/\(category.total)")
                    .font(DesignSystem.Typography.caption)
                    .foregroundColor(DesignSystem.Colors.textSecondary)
                
                Text("\(Int(category.progress * 100))%")
                    .font(DesignSystem.Typography.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(category.color)
                    .frame(width: 35, alignment: .trailing)
            }
            
            progressBar(for: category)
        }
    }
    
    func progressBar(for category: CategoryProgress) -> some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(category.color.opacity(0.2))
                    .frame(height: 8)
                
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(category.color)
                    .frame(
                        width: geo.size.width * category.progress,
                        height: 8
                    )
                    .animation(.spring(duration: 1.0), value: category.progress)
            }
        }
        .frame(height: 8)
    }
}

#Preview {
    CategoryProgressView(categories: [
        CategoryProgress(name: "Regular", icon: "📚", color: .blue, progress: 0.80, learned: 80, total: 100),
        CategoryProgress(name: "Irregular", icon: "⚡", color: .purple, progress: 0.40, learned: 48, total: 120)
    ])
    .padding()
    .background(DesignSystem.Colors.background)
}
