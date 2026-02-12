//
//  VerbKitToolBar.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI

struct VerbKitNavigationBar: ViewModifier {
    let title: String
    
    init(title: String = "VerbKit") {
        self.title = title
    }
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(DesignSystem.Colors.background, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                titleItem
            }
    }
}

// MARK: - Toolbar Items
private extension VerbKitNavigationBar {
    var titleItem: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(title)
                .font(DesignSystem.Typography.title3)
                .fontWeight(.bold)
                .foregroundStyle(DesignSystem.Colors.primaryGradient)
        }
    }
}

// MARK: - View Extension
extension View {
    func verbKitNavigationBar(title: String = "VerbKit") -> some View {
        modifier(VerbKitNavigationBar(title: title))
    }
}
