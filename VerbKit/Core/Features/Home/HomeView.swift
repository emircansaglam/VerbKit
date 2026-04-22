//
//  HomeView.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            ZStack {
                DesignSystem.Colors.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: DesignSystem.Spacing.lg) {
                        greetingSection
                        dailyGoalCard
                        continueLearningSection
                        categoriesSection
                        mascotTipSection
                    }
                    .padding(.horizontal, DesignSystem.Spacing.screenEdge)
                    .padding(.bottom, 80)
                }
            }
            .verbKitNavigationBar()
            .onAppear {
                viewModel.loadData(context: context)
            }
        }
    }
}

// MARK: - Subviews
private extension HomeView {
    var greetingSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(viewModel.timeBasedGreeting)
                    .font(DesignSystem.Typography.title2)
                    .fontWeight(.bold)
                
                Text(viewModel.motivationalMessage)
                    .font(DesignSystem.Typography.subheadline)
                    .foregroundColor(DesignSystem.Colors.textSecondary)
            }
            Spacer()
        }
        .padding(.top, DesignSystem.Spacing.md)
    }
    
    var dailyGoalCard: some View {
        DailyGoalCard(
            currentProgress: viewModel.dailyProgress,
            goal: viewModel.dailyGoal,
            streak: viewModel.streak
        )
    }
    
    var continueLearningSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            sectionHeader(title: "Continue Learning")
            
            if let lastCategory = viewModel.lastStudiedCategory {
                ContinueLearningCard(category: lastCategory)
            }
        }
    }
    
    var categoriesSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            sectionHeader(title: "Categories")
            
            LazyVGrid(
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ],
                spacing: DesignSystem.Spacing.md
            ) {
                ForEach(viewModel.categories) { category in
                    CategoryCard(category: category)
                }
            }
        }
    }
    
    var mascotTipSection: some View {
        MascotTipView(tip: viewModel.dailyTip)
    }
    
    func sectionHeader(title: String) -> some View {
        Text(title)
            .font(DesignSystem.Typography.title3)
            .fontWeight(.semibold)
    }
}

#Preview {
    HomeView()
}
