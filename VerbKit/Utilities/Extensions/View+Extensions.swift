//
//  View+Extensions.swift
//  VerbKit
//
//  Created by emircan.saglam on 8.02.2026.
//

import SwiftUI

extension View {
    // MARK: - Padding Shortcuts
    func paddingStandard() -> some View {
        self.padding(DesignSystem.Spacing.md)
    }
    
    func paddingLarge() -> some View {
        self.padding(DesignSystem.Spacing.lg)
    }
    
    func paddingSmall() -> some View {
        self.padding(DesignSystem.Spacing.sm)
    }
    
    func paddingScreen() -> some View {
        self.padding(.horizontal, DesignSystem.Spacing.screenEdge)
    }
    
    // MARK: - Card Style
    func cardStyle(
        background: Color = DesignSystem.Colors.cardBackground,
        cornerRadius: CGFloat = DesignSystem.CornerRadius.card,
        shadow: Bool = true
    ) -> some View {
        self
            .background(background)
            .cornerRadius(cornerRadius)
            .shadow(
                color: shadow ? DesignSystem.Shadow.md.color : .clear,
                radius: shadow ? DesignSystem.Shadow.md.radius : 0,
                x: shadow ? DesignSystem.Shadow.md.x : 0,
                y: shadow ? DesignSystem.Shadow.md.y : 0
            )
    }
    
    // MARK: - Gradient Background
    func gradientBackground(_ gradient: LinearGradient = DesignSystem.Colors.subtleGradient) -> some View {
        self
            .background(gradient)
    }
    
    // MARK: - Standard Spring Animation
    func withStandardSpring() -> Animation {
        .spring(
            duration: DesignSystem.Animation.springDuration,
            bounce: DesignSystem.Animation.springBounce
        )
    }
    
    // MARK: - Glow Effect
    func glowEffect(color: Color = DesignSystem.Colors.primary, radius: CGFloat = 10) -> some View {
        self
            .shadow(color: color.opacity(0.5), radius: radius, x: 0, y: 0)
            .shadow(color: color.opacity(0.3), radius: radius * 2, x: 0, y: 0)
    }
}
