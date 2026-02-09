//
//  TabBarButton.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: TabItem
    @Namespace private var animation
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabItem.allCases, id: \.self) { tab in
                TabBarButton(
                    tab: tab,
                    selectedTab: $selectedTab,
                    animation: animation
                )
            }
        }
        .applyTabBarContainerStyle()
    }
}

#Preview {
    VStack {
        Spacer()
        CustomTabBar(selectedTab: .constant(.home))
    }
}
