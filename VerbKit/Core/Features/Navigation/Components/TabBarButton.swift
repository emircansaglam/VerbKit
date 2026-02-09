//
//  TabBarButton.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

import SwiftUI

struct TabBarButton: View {
    let tab: TabItem
    @Binding var selectedTab: TabItem
    let animation: Namespace.ID
    
    var body: some View {
        Button {
            handleTabSelection()
        } label: {
            tabContent
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Subviews
private extension TabBarButton {
    var tabContent: some View {
        VStack(spacing: DesignSystem.TabBar.iconLabelSpacing) {
            iconWithBackground
            tabLabel
        }
        .frame(maxWidth: .infinity)
    }
    
    var iconWithBackground: some View {
        ZStack {
            if isSelected {
                selectedBackground
            }
            tabIcon
        }
        .frame(height: DesignSystem.TabBar.iconBackgroundSize)
    }
    
    var selectedBackground: some View {
        Circle()
            .fill(tab.color.opacity(DesignSystem.TabBar.selectedBackgroundOpacity))
            .frame(
                width: DesignSystem.TabBar.iconBackgroundSize,
                height: DesignSystem.TabBar.iconBackgroundSize
            )
            .matchedGeometryEffect(
                id: "background",
                in: animation
            )
    }
    
    var tabIcon: some View {
        Image(systemName: tab.icon)
            .font(.system(
                size: DesignSystem.TabBar.iconSize,
                weight: .semibold
            ))
            .foregroundStyle(isSelected ? tab.color : Color.gray)
            .scaleEffect(
                isSelected
                    ? DesignSystem.TabBar.selectedIconScale
                    : DesignSystem.TabBar.unselectedIconScale
            )
    }
    
    var tabLabel: some View {
        Text(tab.title)
            .font(DesignSystem.Typography.caption2)
            .fontWeight(isSelected ? .semibold : .regular)
            .foregroundStyle(isSelected ? tab.color : Color.gray)
            .opacity(
                isSelected
                    ? DesignSystem.Opacity.full
                    : DesignSystem.TabBar.unselectedOpacity
            )
    }
}

// MARK: - Helpers
private extension TabBarButton {
    var isSelected: Bool {
        selectedTab == tab
    }
    
    func handleTabSelection() {
        withAnimation(
            .spring(
                duration: DesignSystem.TabBar.springDuration,
                bounce: DesignSystem.TabBar.springBounce
            )
        ) {
            selectedTab = tab
        }
    }
}

#Preview {
    TabBarButton(
        tab: .home,
        selectedTab: .constant(.home),
        animation: Namespace().wrappedValue
    )
}
