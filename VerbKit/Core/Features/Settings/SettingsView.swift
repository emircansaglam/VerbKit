//
//  SettingsView.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI

struct SettingsView: View {
    @State private var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                DesignSystem.Colors.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: DesignSystem.Spacing.lg) {
                        profileSection
                        learningSection
                        appSection
                        aboutSection
                    }
                    .padding(.horizontal, DesignSystem.Spacing.screenEdge)
                    .padding(.vertical, DesignSystem.Spacing.md)
                    .padding(.bottom, 80)
                }
            }
            .verbKitNavigationBar(title: "Settings")
        }
    }
}

// MARK: - Sections
private extension SettingsView {
    var profileSection: some View {
        settingsCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                ZStack {
                    Circle()
                        .fill(DesignSystem.Colors.primaryGradient)
                        .frame(width: 56, height: 56)
                    
                    Text("👤")
                        .font(.system(size: 28))
                }
                
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                    Text("Guest User")
                        .font(DesignSystem.Typography.bodyBold)
                    
                    Text("Learning locally on this device")
                        .font(DesignSystem.Typography.caption)
                        .foregroundColor(DesignSystem.Colors.textSecondary)
                }
                
                Spacer()
            }
            .padding(DesignSystem.Spacing.cardPadding)
        }
    }
    
    var learningSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            sectionTitle("Learning")
            
            settingsCard {
                VStack(spacing: 0) {
                    // Daily Goal
                    HStack {
                        settingsIcon("🎯", color: .orange)
                        
                        Text("Daily Goal")
                            .font(DesignSystem.Typography.subheadline)
                        
                        Spacer()
                        
                        Picker("", selection: $viewModel.dailyGoal) {
                            ForEach(viewModel.dailyGoalOptions, id: \.self) { option in
                                Text("\(option) verbs").tag(option)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(DesignSystem.Colors.primary)
                    }
                    .padding(DesignSystem.Spacing.cardPadding)
                    
                    divider
                    
                    // Daily Reminder Toggle
                    HStack {
                        settingsIcon("🔔", color: .blue)
                        
                        Text("Daily Reminder")
                            .font(DesignSystem.Typography.subheadline)
                        
                        Spacer()
                        
                        Toggle("", isOn: $viewModel.reminderEnabled)
                            .tint(DesignSystem.Colors.primary)
                    }
                    .padding(DesignSystem.Spacing.cardPadding)
                    
                    // Reminder Time - only when enabled
                    if viewModel.reminderEnabled {
                        divider
                        
                        HStack {
                            settingsIcon("🕐", color: .blue)
                            
                            Text("Reminder Time")
                                .font(DesignSystem.Typography.subheadline)
                            
                            Spacer()
                            
                            Picker("", selection: $viewModel.reminderHour) {
                                ForEach(6..<24, id: \.self) { hour in
                                    Text(String(format: "%02d:00", hour)).tag(hour)
                                }
                            }
                            .pickerStyle(.menu)
                            .tint(DesignSystem.Colors.primary)
                        }
                        .padding(DesignSystem.Spacing.cardPadding)
                    }
                    
                    divider
                    
                    // Sound Effects
                    HStack {
                        settingsIcon("🔊", color: .green)
                        
                        Text("Sound Effects")
                            .font(DesignSystem.Typography.subheadline)
                        
                        Spacer()
                        
                        Toggle("", isOn: $viewModel.soundEnabled)
                            .tint(DesignSystem.Colors.primary)
                    }
                    .padding(DesignSystem.Spacing.cardPadding)
                }
            }
        }
    }
    
    var appSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            sectionTitle("App")
            
            settingsCard {
                VStack(spacing: 0) {
                    settingsRow(icon: "🌙", color: .indigo, title: "Dark Mode") {
                        // TODO: Dark mode implementation
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(DesignSystem.Colors.textSecondary)
                    }
                    
                    divider
                    
                    settingsRow(icon: "⭐", color: .yellow, title: "Rate VerbKit") {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(DesignSystem.Colors.textSecondary)
                    } action: {
                        viewModel.openAppStore()
                    }
                }
            }
        }
    }
    
    var aboutSection: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            sectionTitle("About")
            
            settingsCard {
                VStack(spacing: 0) {
                    settingsRow(icon: "🔒", color: .gray, title: "Privacy Policy") {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(DesignSystem.Colors.textSecondary)
                    } action: {
                        viewModel.openPrivacyPolicy()
                    }
                    
                    divider
                    
                    settingsRow(icon: "✉️", color: DesignSystem.Colors.primary, title: "Contact Us") {
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(DesignSystem.Colors.textSecondary)
                    } action: {
                        viewModel.openContactEmail()
                    }
                    
                    divider
                    
                    HStack {
                        settingsIcon("📋", color: .gray)
                        
                        Text("Version")
                            .font(DesignSystem.Typography.subheadline)
                        
                        Spacer()
                        
                        Text(viewModel.appVersion)
                            .font(DesignSystem.Typography.subheadline)
                            .foregroundColor(DesignSystem.Colors.textSecondary)
                    }
                    .padding(DesignSystem.Spacing.cardPadding)
                }
            }
        }
    }
}

// MARK: - Helpers
private extension SettingsView {
    func settingsCard<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        content()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.card))
            .shadow(
                color: DesignSystem.Shadow.sm.color,
                radius: DesignSystem.Shadow.sm.radius,
                y: DesignSystem.Shadow.sm.y
            )
    }
    
    func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(DesignSystem.Typography.footnote)
            .fontWeight(.semibold)
            .foregroundColor(DesignSystem.Colors.textSecondary)
            .textCase(.uppercase)
            .padding(.leading, DesignSystem.Spacing.xs)
    }
    
    func settingsIcon(_ icon: String, color: Color) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.sm)
                .fill(color.opacity(0.15))
                .frame(width: 32, height: 32)
            
            Text(icon)
                .font(.system(size: 16))
        }
    }
    
    func settingsRow<Trailing: View>(
        icon: String,
        color: Color,
        title: String,
        @ViewBuilder trailing: () -> Trailing,
        action: (() -> Void)? = nil
    ) -> some View {
        Button {
            action?()
        } label: {
            HStack {
                settingsIcon(icon, color: color)
                
                Text(title)
                    .font(DesignSystem.Typography.subheadline)
                    .foregroundColor(DesignSystem.Colors.textPrimary)
                
                Spacer()
                
                trailing()
            }
            .padding(DesignSystem.Spacing.cardPadding)
        }
        .buttonStyle(.plain)
    }
    
    var divider: some View {
        Divider()
            .padding(.leading, 56)
    }
}

#Preview {
    SettingsView()
}
