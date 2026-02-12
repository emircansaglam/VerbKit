//
//  MascotTipView.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI

struct MascotTipView: View {
    let tip: String
    
    var body: some View {
        cardContainer
    }
}

// MARK: - Subviews
private extension MascotTipView {
    var cardContainer: some View {
        HStack(alignment: .top, spacing: DesignSystem.Spacing.md) {  // ✅ alignment: .top
            mascotImage
            
            tipText
                .frame(maxWidth: .infinity, alignment: .leading)  // ✅ Expand
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
                DesignSystem.Colors.primary.opacity(0.1),
                DesignSystem.Colors.secondary.opacity(0.05)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var mascotImage: some View {
        Image("fish-mascot")
            .resizable()
            .scaledToFit()
            .frame(width: 60, height: 60)
    }
    
    var tipText: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
            Text("Tip of the Day 💡")
                .font(DesignSystem.Typography.caption)
                .foregroundColor(DesignSystem.Colors.textSecondary)
                .fontWeight(.medium)
            
            Text(tip)
                .font(DesignSystem.Typography.subheadline)
                .foregroundColor(DesignSystem.Colors.textPrimary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    MascotTipView(tip: "Practice 10 minutes daily for better retention! 🎯")
        .padding()
        .background(DesignSystem.Colors.background)
}
