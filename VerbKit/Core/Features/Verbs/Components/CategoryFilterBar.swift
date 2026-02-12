//
//  CategoryFilterBar.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI

struct CategoryFilterBar: View {
    @Binding var selectedCategory: VerbCategory?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DesignSystem.Spacing.sm) {
                filterChip(title: "All", category: nil)
                
                ForEach(VerbCategory.allCases) { category in
                    filterChip(
                        title: category.rawValue,
                        category: category,
                        icon: category.icon
                    )
                }
            }
            .padding(.horizontal, DesignSystem.Spacing.screenEdge)
        }
    }
}

// MARK: - Subviews
private extension CategoryFilterBar {
    func filterChip(
        title: String,
        category: VerbCategory?,
        icon: String? = nil
    ) -> some View {
        Button {
            withAnimation(.spring(duration: 0.3)) {
                selectedCategory = category
            }
        } label: {
            HStack(spacing: DesignSystem.Spacing.xs) {
                if let icon = icon {
                    Text(icon)
                }
                
                Text(title)
                    .font(DesignSystem.Typography.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, DesignSystem.Spacing.md)
            .padding(.vertical, DesignSystem.Spacing.sm)
            .background(chipBackground(for: category))
            .foregroundColor(chipForeground(for: category))
            .clipShape(Capsule())
        }
    }
    
    func chipBackground(for category: VerbCategory?) -> Color {
        if selectedCategory == category {
            return category?.color ?? DesignSystem.Colors.primary
        } else {
            return Color.gray.opacity(0.1)
        }
    }
    
    func chipForeground(for category: VerbCategory?) -> Color {
        if selectedCategory == category {
            return .white
        } else {
            return DesignSystem.Colors.textSecondary
        }
    }
}

#Preview {
    CategoryFilterBar(selectedCategory: .constant(.irregular))
}
