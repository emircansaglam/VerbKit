//
//  DesignSystem.swift
//  VerbKit
//
//  Created by emircan.saglam on 8.02.2026.
//

import SwiftUI

struct DesignSystem {
    // MARK: - Colors
    struct Colors {
        // Primary colors from mascot
        static let primary = Color(hex: "5DD5D5")          // Turquoise (fish body)
        static let secondary = Color(hex: "A78BFA")        // Purple (fins)
        static let accent = Color(hex: "EC4899")           // Pink (book/accent)
        
        // Background colors
        static let background = Color(hex: "F8FAFC")
        static let cardBackground = Color.white
        
        // Text colors
        static let textPrimary = Color.primary
        static let textSecondary = Color.secondary
        static let textTertiary = Color(hex: "94A3B8")
        
        // Semantic colors
        static let success = Color(hex: "10B981")
        static let error = Color(hex: "EF4444")
        static let warning = Color(hex: "F59E0B")
        static let info = Color(hex: "3B82F6")
        
        // Gradients
        static let primaryGradient = LinearGradient(
            colors: [
                Color(hex: "5DD5D5"),
                Color(hex: "A78BFA"),
                Color(hex: "EC4899")
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let subtleGradient = LinearGradient(
            colors: [
                Color(hex: "5DD5D5").opacity(0.1),
                Color(hex: "A78BFA").opacity(0.1)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        static let cardGradient = LinearGradient(
            colors: [
                Color.white,
                Color(hex: "F8FAFC")
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    // MARK: - Typography
    struct Typography {
        // Title styles
        static let largeTitle = Font.system(size: 34, weight: .bold, design: .rounded)
        static let title = Font.system(size: 28, weight: .semibold, design: .rounded)
        static let title2 = Font.system(size: 22, weight: .semibold, design: .rounded)
        static let title3 = Font.system(size: 20, weight: .semibold, design: .rounded)
        
        // Body styles
        static let body = Font.system(size: 17, weight: .regular, design: .rounded)
        static let bodyBold = Font.system(size: 17, weight: .semibold, design: .rounded)
        static let callout = Font.system(size: 16, weight: .regular, design: .rounded)
        
        // Small text
        static let subheadline = Font.system(size: 15, weight: .regular, design: .rounded)
        static let footnote = Font.system(size: 13, weight: .regular, design: .rounded)
        static let caption = Font.system(size: 12, weight: .regular, design: .rounded)
        static let caption2 = Font.system(size: 11, weight: .regular, design: .rounded)
    }
    
    // MARK: - Spacing
    struct Spacing {
        static let xxs: CGFloat = 2
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 16
        static let lg: CGFloat = 24
        static let xl: CGFloat = 32
        static let xxl: CGFloat = 48
        static let xxxl: CGFloat = 64
        
        // Semantic spacing
        static let screenEdge: CGFloat = 20
        static let cardPadding: CGFloat = 16
        static let itemSpacing: CGFloat = 12
        static let sectionSpacing: CGFloat = 24
    }
    
    // MARK: - Corner Radius
    struct CornerRadius {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let xxl: CGFloat = 24
        static let xxxl: CGFloat = 32
        
        // Semantic radius
        static let button: CGFloat = 12
        static let card: CGFloat = 20
        static let sheet: CGFloat = 24
    }
    
    // MARK: - Animation
    struct Animation {
        // Duration
        static let instant: Double = 0.1
        static let fast: Double = 0.2
        static let medium: Double = 0.3
        static let slow: Double = 0.5
        static let verySlow: Double = 0.8
        
        // Spring animation parameters
        static let springDuration: Double = 1.2
        static let springBounce: Double = 0.4
        
        // Delays
        static let splashDelay: Double = 2.5
        static let shortDelay: Double = 0.1
        static let mediumDelay: Double = 0.3
        static let longDelay: Double = 0.5
    }
    
    // MARK: - Size
    struct Size {
        // Icon sizes
        static let iconXS: CGFloat = 16
        static let iconSm: CGFloat = 20
        static let iconMd: CGFloat = 24
        static let iconLg: CGFloat = 32
        static let iconXL: CGFloat = 40
        
        // Mascot sizes
        static let mascotSm: CGFloat = 80
        static let mascotMd: CGFloat = 120
        static let mascotLg: CGFloat = 180
        static let mascotXL: CGFloat = 240
        
        // Card/Component sizes
        static let cardHeight: CGFloat = 120
        static let buttonHeight: CGFloat = 50
        static let inputHeight: CGFloat = 48
        static let thumbnailSize: CGFloat = 60
    }
    
    // MARK: - Shadow
    struct Shadow {
        static let none = (color: Color.clear, radius: CGFloat(0), x: CGFloat(0), y: CGFloat(0))
        static let xs = (color: Color.black.opacity(0.03), radius: CGFloat(2), x: CGFloat(0), y: CGFloat(1))
        static let sm = (color: Color.black.opacity(0.05), radius: CGFloat(4), x: CGFloat(0), y: CGFloat(2))
        static let md = (color: Color.black.opacity(0.1), radius: CGFloat(8), x: CGFloat(0), y: CGFloat(4))
        static let lg = (color: Color.black.opacity(0.15), radius: CGFloat(16), x: CGFloat(0), y: CGFloat(8))
        static let xl = (color: Color.black.opacity(0.2), radius: CGFloat(24), x: CGFloat(0), y: CGFloat(12))
        
        // Colored shadows
        static let primaryGlow = (color: Color(hex: "5DD5D5").opacity(0.3), radius: CGFloat(16), x: CGFloat(0), y: CGFloat(4))
        static let accentGlow = (color: Color(hex: "EC4899").opacity(0.3), radius: CGFloat(16), x: CGFloat(0), y: CGFloat(4))
    }
    
    // MARK: - Opacity
    struct Opacity {
        static let invisible: Double = 0
        static let subtle: Double = 0.1
        static let light: Double = 0.3
        static let medium: Double = 0.5
        static let strong: Double = 0.7
        static let veryStrong: Double = 0.9
        static let full: Double = 1.0
    }
}

// MARK: - Color Extension (Hex Support)
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension DesignSystem {
    struct TabBar {
        // Icon sizes
        static let iconSize: CGFloat = 20
        static let iconBackgroundSize: CGFloat = 50
        
        // Spacing
        static let iconLabelSpacing: CGFloat = 4
        
        // Opacity
        static let unselectedOpacity: Double = 0.6
        static let selectedBackgroundOpacity: Double = 0.15
        
        // Scale
        static let selectedIconScale: CGFloat = 1.1
        static let unselectedIconScale: CGFloat = 1.0
        
        // Animation
        static let springDuration: Double = 0.4
        static let springBounce: Double = 0.3
    }
}
