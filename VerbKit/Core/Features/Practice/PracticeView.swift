//
//  PracticeView.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                DesignSystem.Colors.background
                    .ignoresSafeArea()
                
                Text("📚 Pactice View")
                    .font(DesignSystem.Typography.largeTitle)
            }
            .verbKitNavigationBar(title: "Practice")
        }
    }
}

#Preview {
    PracticeView()
}
