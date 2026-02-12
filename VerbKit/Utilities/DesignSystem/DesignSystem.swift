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
        /// Turquoise - Primary brand color (fish body)
        static let primary = Color(hex: "5DD5D5")
        /// Purple - Secondary brand color (fins)
        static let secondary = Color(hex: "A78BFA")
        /// Pink - Accent color (book/accent)
        static let accent = Color(hex: "EC4899")
        
        /// F8FAFC - Main app background
        static let background = Color(hex: "F8FAFC")
        /// White - Card background
        static let cardBackground = Color.white
        
        /// Primary text color
        static let textPrimary = Color.primary
        /// Secondary text color
        static let textSecondary = Color.secondary
        /// 94A3B8 - Tertiary/hint text
        static let textTertiary = Color(hex: "94A3B8")
        
        /// 10B981 - Success/positive states
        static let success = Color(hex: "10B981")
        /// EF4444 - Error/negative states
        static let error = Color(hex: "EF4444")
        /// F59E0B - Warning states
        static let warning = Color(hex: "F59E0B")
        /// 3B82F6 - Info states
        static let info = Color(hex: "3B82F6")
        
        /// Turquoise → Purple → Pink gradient
        static let primaryGradient = LinearGradient(
            colors: [
                Color(hex: "5DD5D5"),
                Color(hex: "A78BFA"),
                Color(hex: "EC4899")
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        /// Subtle version of primary gradient (10% opacity)
        static let subtleGradient = LinearGradient(
            colors: [
                Color(hex: "5DD5D5").opacity(0.1),
                Color(hex: "A78BFA").opacity(0.1)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        /// White → F8FAFC card gradient
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
        /// 34pt - Bold rounded - Page titles
        static let largeTitle = Font.system(size: 34, weight: .bold, design: .rounded)
        /// 28pt - Semibold rounded - Section titles
        static let title = Font.system(size: 28, weight: .semibold, design: .rounded)
        /// 22pt - Semibold rounded - Card titles
        static let title2 = Font.system(size: 22, weight: .semibold, design: .rounded)
        /// 20pt - Semibold rounded - Sub titles
        static let title3 = Font.system(size: 20, weight: .semibold, design: .rounded)
        /// 17pt - Regular rounded - Body text
        static let body = Font.system(size: 17, weight: .regular, design: .rounded)
        /// 17pt - Semibold rounded - Emphasized body text
        static let bodyBold = Font.system(size: 17, weight: .semibold, design: .rounded)
        /// 16pt - Regular rounded - Callout text
        static let callout = Font.system(size: 16, weight: .regular, design: .rounded)
        /// 15pt - Regular rounded - Secondary text
        static let subheadline = Font.system(size: 15, weight: .regular, design: .rounded)
        /// 13pt - Regular rounded - Footnotes
        static let footnote = Font.system(size: 13, weight: .regular, design: .rounded)
        /// 12pt - Regular rounded - Captions
        static let caption = Font.system(size: 12, weight: .regular, design: .rounded)
        /// 11pt - Regular rounded - Small labels
        static let caption2 = Font.system(size: 11, weight: .regular, design: .rounded)
    }
    
    // MARK: - Spacing
    struct Spacing {
        /// 2px - Minimum spacing
        static let xxs: CGFloat = 2
        /// 4px - Extra small spacing
        static let xs: CGFloat = 4
        /// 8px - Small spacing
        static let sm: CGFloat = 8
        /// 16px - Medium spacing
        static let md: CGFloat = 16
        /// 24px - Large spacing
        static let lg: CGFloat = 24
        /// 32px - Extra large spacing
        static let xl: CGFloat = 32
        /// 48px - Double extra large spacing
        static let xxl: CGFloat = 48
        /// 64px - Triple extra large spacing
        static let xxxl: CGFloat = 64
        
        /// 20px - Screen edge padding
        static let screenEdge: CGFloat = 20
        /// 16px - Card inner padding
        static let cardPadding: CGFloat = 16
        /// 12px - Item spacing
        static let itemSpacing: CGFloat = 12
        /// 24px - Section spacing
        static let sectionSpacing: CGFloat = 24
    }
    
    // MARK: - Corner Radius
    struct CornerRadius {
        /// 4px - Minimum radius
        static let xs: CGFloat = 4
        /// 8px - Small radius
        static let sm: CGFloat = 8
        /// 12px - Medium radius
        static let md: CGFloat = 12
        /// 16px - Large radius
        static let lg: CGFloat = 16
        /// 20px - Extra large radius
        static let xl: CGFloat = 20
        /// 24px - Double extra large radius
        static let xxl: CGFloat = 24
        /// 32px - Triple extra large radius
        static let xxxl: CGFloat = 32
        
        /// 12px - Standard button radius
        static let button: CGFloat = 12
        /// 20px - Standard card radius
        static let card: CGFloat = 20
        /// 24px - Bottom sheet radius
        static let sheet: CGFloat = 24
    }
    
    // MARK: - Animation
    struct Animation {
        /// 0.1s - Instant feedback
        static let instant: Double = 0.1
        /// 0.2s - Fast transitions
        static let fast: Double = 0.2
        /// 0.3s - Standard transitions
        static let medium: Double = 0.3
        /// 0.5s - Slow transitions
        static let slow: Double = 0.5
        /// 0.8s - Very slow transitions
        static let verySlow: Double = 0.8
        
        /// 1.2s - Spring animation duration
        static let springDuration: Double = 1.2
        /// 0.4 - Spring bounce amount (40%)
        static let springBounce: Double = 0.4
        
        /// 2.5s - Splash screen display duration
        static let splashDelay: Double = 2.5
        /// 0.1s - Short animation delay
        static let shortDelay: Double = 0.1
        /// 0.3s - Medium animation delay
        static let mediumDelay: Double = 0.3
        /// 0.5s - Long animation delay
        static let longDelay: Double = 0.5
    }
    
    // MARK: - Size
    struct Size {
        /// 16px - Extra small icon
        static let iconXS: CGFloat = 16
        /// 20px - Small icon
        static let iconSm: CGFloat = 20
        /// 24px - Medium icon
        static let iconMd: CGFloat = 24
        /// 32px - Large icon
        static let iconLg: CGFloat = 32
        /// 40px - Extra large icon
        static let iconXL: CGFloat = 40
        
        /// 80px - Small mascot
        static let mascotSm: CGFloat = 80
        /// 120px - Medium mascot
        static let mascotMd: CGFloat = 120
        /// 180px - Large mascot
        static let mascotLg: CGFloat = 180
        /// 240px - Extra large mascot
        static let mascotXL: CGFloat = 240
        
        /// 120px - Standard card height
        static let cardHeight: CGFloat = 120
        /// 50px - Standard button height
        static let buttonHeight: CGFloat = 50
        /// 48px - Standard input height
        static let inputHeight: CGFloat = 48
        /// 60px - Standard thumbnail size
        static let thumbnailSize: CGFloat = 60
    }
    
    // MARK: - Shadow
    struct Shadow {
        /// No shadow
        static let none = (color: Color.clear, radius: CGFloat(0), x: CGFloat(0), y: CGFloat(0))
        /// Opacity 3% - radius 2px - y 1px
        static let xs = (color: Color.black.opacity(0.03), radius: CGFloat(2), x: CGFloat(0), y: CGFloat(1))
        /// Opacity 5% - radius 4px - y 2px
        static let sm = (color: Color.black.opacity(0.05), radius: CGFloat(4), x: CGFloat(0), y: CGFloat(2))
        /// Opacity 10% - radius 8px - y 4px
        static let md = (color: Color.black.opacity(0.1), radius: CGFloat(8), x: CGFloat(0), y: CGFloat(4))
        /// Opacity 15% - radius 16px - y 8px
        static let lg = (color: Color.black.opacity(0.15), radius: CGFloat(16), x: CGFloat(0), y: CGFloat(8))
        /// Opacity 20% - radius 24px - y 12px
        static let xl = (color: Color.black.opacity(0.2), radius: CGFloat(24), x: CGFloat(0), y: CGFloat(12))
        
        /// Primary color glow - opacity 30% - radius 16px
        static let primaryGlow = (color: Color(hex: "5DD5D5").opacity(0.3), radius: CGFloat(16), x: CGFloat(0), y: CGFloat(4))
        /// Accent color glow - opacity 30% - radius 16px
        static let accentGlow = (color: Color(hex: "EC4899").opacity(0.3), radius: CGFloat(16), x: CGFloat(0), y: CGFloat(4))
    }
    
    // MARK: - Opacity
    struct Opacity {
        /// 0% - Fully transparent
        static let invisible: Double = 0.0
        /// 10% - Subtle backgrounds
        static let subtle: Double = 0.1
        /// 30% - Light overlays
        static let light: Double = 0.3
        /// 50% - Medium overlays
        static let medium: Double = 0.5
        /// 70% - Strong overlays
        static let strong: Double = 0.7
        /// 90% - Very strong overlays
        static let veryStrong: Double = 0.9
        /// 100% - Fully opaque
        static let full: Double = 1.0
    }
}

// MARK: - TabBar Constants
extension DesignSystem {
    struct TabBar {
        /// 20px - Tab icon size
        static let iconSize: CGFloat = 20
        /// 50px - Selected icon background size
        static let iconBackgroundSize: CGFloat = 50
        /// 4px - Space between icon and label
        static let iconLabelSpacing: CGFloat = 4
        /// 60% - Unselected tab opacity
        static let unselectedOpacity: Double = 0.6
        /// 15% - Selected background opacity
        static let selectedBackgroundOpacity: Double = 0.15
        /// 110% - Selected icon scale
        static let selectedIconScale: CGFloat = 1.1
        /// 100% - Unselected icon scale
        static let unselectedIconScale: CGFloat = 1.0
        /// 0.4s - Spring animation duration
        static let springDuration: Double = 0.4
        /// 30% - Spring bounce amount
        static let springBounce: Double = 0.3
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
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
