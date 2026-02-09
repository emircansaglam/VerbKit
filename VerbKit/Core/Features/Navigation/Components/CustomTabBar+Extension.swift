//
//  CustomTabBar+Extension.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

// MARK: - View Extensions for TabBar Styling
extension View {
    func applyTabBarContainerStyle() -> some View {
        self
            .padding(.horizontal, DesignSystem.Spacing.md)
            .padding(.vertical, DesignSystem.Spacing.sm)
            .background {
                tabBarBackground
            }
            .padding(.horizontal, DesignSystem.Spacing.lg)
            .padding(.bottom, DesignSystem.Spacing.sm)
    }
    
    private var tabBarBackground: some View {
        RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xl)
            .fill(.ultraThinMaterial)
            .shadow(
                color: DesignSystem.Shadow.md.color,
                radius: DesignSystem.Shadow.md.radius,
                y: DesignSystem.Shadow.md.y
            )
    }
}
