//
//  TimerBar.swift
//  VerbKit
//
//  Created by emircan.saglam on 13.02.2026.
//

import SwiftUI

struct TimerBar: View {
    let progress: Double
    let timeRemaining: Double
    
    private var barColor: Color {
        switch timeRemaining {
        case 6...: return DesignSystem.Colors.primary
        case 3..<6: return DesignSystem.Colors.warning
        default: return DesignSystem.Colors.error
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(Color.gray.opacity(0.15))
                    .frame(height: 8)
                
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xs)
                    .fill(barColor)
                    .frame(
                        width: geo.size.width * max(0, progress),
                        height: 8
                    )
                    .animation(.linear(duration: 0.1), value: progress)
            }
        }
        .frame(height: 8)
    }
}

#Preview {
    VStack(spacing: 20) {
        TimerBar(progress: 1.0, timeRemaining: 10)
        TimerBar(progress: 0.5, timeRemaining: 5)
        TimerBar(progress: 0.2, timeRemaining: 2)
    }
    .padding()
    .background(DesignSystem.Colors.background)
}
