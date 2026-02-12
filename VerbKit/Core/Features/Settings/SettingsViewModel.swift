//
//  SettingsViewModel.swift
//  VerbKit
//
//  Created by emircan.saglam on 12.02.2026.
//

import SwiftUI

@Observable
final class SettingsViewModel {
    var dailyGoal: Int = 10
    var reminderEnabled: Bool = false
    var reminderHour: Int = 20
    var soundEnabled: Bool = true
    
    let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    let dailyGoalOptions = [5, 10, 15, 20, 25, 30]
    
    func openAppStore() {
        guard let url = URL(string: "https://apps.apple.com/app/idYOUR_APP_ID") else { return }
        UIApplication.shared.open(url)
    }
    
    func openPrivacyPolicy() {
        guard let url = URL(string: "https://YOUR_PRIVACY_POLICY_URL") else { return }
        UIApplication.shared.open(url)
    }
    
    func openContactEmail() {
        guard let url = URL(string: "mailto:support@verbkit.app") else { return }
        UIApplication.shared.open(url)
    }
}
