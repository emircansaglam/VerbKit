//
//  TabItem.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

enum TabItem: Int, CaseIterable {
    case home = 0
    case verbs = 1
    case practice = 2
    case progress = 3
    case settings = 4
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .verbs: return "Verbs"
        case .practice: return "Practice"
        case .progress: return "Progress"
        case .settings: return "Settings"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .verbs: return "book.fill"
        case .practice: return "pencil.and.scribble"
        case .progress: return "chart.bar.fill"
        case .settings: return "gearshape.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return DesignSystem.Colors.primary
        case .verbs: return DesignSystem.Colors.secondary
        case .practice: return DesignSystem.Colors.accent
        case .progress: return Color.green
        case .settings: return Color.gray
        }
    }
}
