//
//  WeeklyActivityView.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI

struct WeeklyActivityView: View {
    let activities: [DayActivity]
    
    private var maxCount: Int {
        activities.map { $0.verbCount }.max() ?? 1
    }
    
    var body: some View {
        cardContainer
    }
}

// MARK: - Subviews
private extension WeeklyActivityView {
    var cardContainer: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            headerSection
            activityBars
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
            Text("Weekly Activity")
                .font(DesignSystem.Typography.title3)
                .fontWeight(.semibold)
            
            Spacer()
            
            Text("This Week")
                .font(DesignSystem.Typography.caption)
                .foregroundColor(DesignSystem.Colors.textSecondary)
        }
    }
    
    var activityBars: some View {
        HStack(alignment: .bottom, spacing: DesignSystem.Spacing.sm) {
            ForEach(activities) { activity in
                activityBar(for: activity)
            }
        }
    }
    
    func activityBar(for activity: DayActivity) -> some View {
        VStack(spacing: DesignSystem.Spacing.xs) {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(Color.gray.opacity(0.1))
                    .frame(height: 80)
                
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(barColor(for: activity))
                    .frame(
                        height: activity.verbCount == 0
                            ? 4
                            : 80 * CGFloat(activity.verbCount) / CGFloat(maxCount)
                    )
            }
            
            Text(activity.day)
                .font(DesignSystem.Typography.caption2)
                .foregroundColor(
                    activity.isToday
                        ? DesignSystem.Colors.primary
                        : DesignSystem.Colors.textSecondary
                )
                .fontWeight(activity.isToday ? .semibold : .regular)
        }
        .frame(maxWidth: .infinity)
    }
    
    func barColor(for activity: DayActivity) -> some ShapeStyle {
        if activity.verbCount == 0 {
            return AnyShapeStyle(Color.gray.opacity(0.2))
        } else if activity.isToday {
            return AnyShapeStyle(DesignSystem.Colors.primaryGradient)
        } else {
            return AnyShapeStyle(DesignSystem.Colors.primary.opacity(0.6))
        }
    }
}

#Preview {
    WeeklyActivityView(activities: [
        DayActivity(day: "Mon", verbCount: 5, isToday: false),
        DayActivity(day: "Tue", verbCount: 8, isToday: false),
        DayActivity(day: "Wed", verbCount: 0, isToday: false),
        DayActivity(day: "Thu", verbCount: 3, isToday: false),
        DayActivity(day: "Fri", verbCount: 10, isToday: false),
        DayActivity(day: "Sat", verbCount: 6, isToday: false),
        DayActivity(day: "Sun", verbCount: 0, isToday: true)
    ])
    .padding()
    .background(DesignSystem.Colors.background)
}
