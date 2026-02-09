//
//  SettingsView.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                DesignSystem.Colors.background
                    .ignoresSafeArea()
                
                Text("📚 Settings")
                    .font(DesignSystem.Typography.largeTitle)
            }
            .navigationTitle("all settings")
        }
    }
}
#Preview {
    SettingsView()
}
