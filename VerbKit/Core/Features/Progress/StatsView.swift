//
//  ProgressView.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                DesignSystem.Colors.background
                    .ignoresSafeArea()
                
                Text("📚 Stats View")
                    .font(DesignSystem.Typography.largeTitle)
            }
            .navigationTitle("All Verbs")
        }
    }
}
#Preview {
    StatsView()
}
