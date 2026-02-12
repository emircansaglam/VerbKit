//
//  VerbCard.swift
//  VerbKit
//
//  Created by emircan.saglam on 11.02.2026.
//

import SwiftUI

struct VerbCard: View {
    let verb: Verb
    
    var body: some View {
        cardContainer
    }
}

// MARK: - Subviews
private extension VerbCard {
    var cardContainer: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            headerSection
            formsSection
            progressSection
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
                verb.category.color.opacity(0.1),
                verb.category.color.opacity(0.05)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    var headerSection: some View {
        HStack {
            Text(verb.category.icon)
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(verb.baseForm.capitalized)
                    .font(DesignSystem.Typography.title3)
                    .fontWeight(.bold)
                
                Text(verb.meaning)
                    .font(DesignSystem.Typography.caption)
                    .foregroundColor(DesignSystem.Colors.textSecondary)
            }
            
            Spacer()
            
            categoryBadge
        }
    }
    
    var categoryBadge: some View {
        Text(verb.category.rawValue)
            .font(DesignSystem.Typography.caption2)
            .fontWeight(.medium)
            .padding(.horizontal, DesignSystem.Spacing.sm)
            .padding(.vertical, DesignSystem.Spacing.xs)
            .background(verb.category.color.opacity(0.2))
            .foregroundColor(verb.category.color)
            .clipShape(Capsule())
    }
    
    var formsSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
            verbForm(
                label: "Present",
                value: verb.thirdPerson ?? verb.baseForm
            )
            
            verbForm(
                label: "Past",
                value: verb.pastSimple
            )
            
            verbForm(
                label: "Past Participle",
                value: verb.pastParticiple
            )
        }
        .padding(DesignSystem.Spacing.sm)
        .background(Color.white.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.sm))
    }
    
    func verbForm(label: String, value: String) -> some View {
        HStack {
            Text(label + ":")
                .font(DesignSystem.Typography.caption)
                .foregroundColor(DesignSystem.Colors.textSecondary)
                .frame(width: 90, alignment: .leading)
            
            Text(value)
                .font(DesignSystem.Typography.subheadline)
                .fontWeight(.medium)
        }
    }
    
    var progressSection: some View {
        HStack {
            ForEach(0..<3, id: \.self) { index in
                Image(systemName: index < verb.userProgress.stars ? "star.fill" : "star")
                    .foregroundColor(
                        index < verb.userProgress.stars
                            ? Color.yellow
                            : Color.gray.opacity(0.3)
                    )
                    .font(.caption)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(DesignSystem.Colors.textSecondary)
                .font(.caption)
        }
    }
}

#Preview {
    VStack {
        VerbCard(
            verb: Verb(
                id: "1",
                baseForm: "go",
                thirdPerson: "goes",
                pastSimple: "went",
                pastParticiple: "gone",
                category: .irregular,
                meaning: "gitmek",
                exampleSentence: "I go to school.",
                userProgress: .practiced
            )
        )
    }
    .padding()
    .background(DesignSystem.Colors.background)
}
