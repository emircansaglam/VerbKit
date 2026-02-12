//
//  MainTabView.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background
            DesignSystem.Colors.background
                .ignoresSafeArea()
            
            // Tab Content
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(TabItem.home)
                
                VerbListView()
                    .tag(TabItem.verbs)
                
                PracticeView()
                    .tag(TabItem.practice)
                
                StatsView()
                    .tag(TabItem.progress)
                
                SettingsView()
                    .tag(TabItem.settings)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            // Custom TabBar
            CustomTabBar(selectedTab: $selectedTab)
                .zIndex(1)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    MainTabView()
}
