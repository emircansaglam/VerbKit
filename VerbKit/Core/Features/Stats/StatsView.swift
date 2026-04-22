//
//  StatsView.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI

struct StatsView: View {
    @State private var viewModel = StatsViewModel()
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            ZStack {
                DesignSystem.Colors.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: DesignSystem.Spacing.lg) {
                        summarySection
                        weeklyActivitySection
                        categoryProgressSection
                        achievementsSection
                    }
                    .padding(.horizontal, DesignSystem.Spacing.screenEdge)
                    .padding(.vertical, DesignSystem.Spacing.md)
                    .padding(.bottom, 80)
                }
            }
            .verbKitNavigationBar(title: "Stats")
            .onAppear {
                viewModel.loadData(context: context)
            }
        }
    }
}

// MARK: - Subviews
private extension StatsView {
    var summarySection: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            StatsSummaryCard(
                icon: "🔥",
                value: "\(viewModel.currentStreak)",
                title: "Day Streak",
                color: .orange
            )
            StatsSummaryCard(
                icon: "📚",
                value: "\(viewModel.totalLearnedVerbs)",
                title: "Total Learned",
                color: DesignSystem.Colors.primary
            )
            StatsSummaryCard(
                icon: "⭐",
                value: "\(viewModel.masteredVerbs)",
                title: "Mastered",
                color: .yellow
            )
        }
    }
    
    var weeklyActivitySection: some View {
        WeeklyActivityView(activities: viewModel.weeklyActivity)
    }
    
    var categoryProgressSection: some View {
        CategoryProgressView(categories: viewModel.categoryProgress)
    }
    
    var achievementsSection: some View {
        AchievementsView(achievements: viewModel.achievements)
    }
}

#Preview {
    StatsView()
}
