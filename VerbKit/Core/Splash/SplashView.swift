import SwiftUI

struct SplashView: View {
    @State private var isAnimating = false
    @State private var showApp = false
    
    var body: some View {
        ZStack {
            backgroundGradient
            contentView
        }
        .onAppear {
            handleAppearance()
        }
        .fullScreenCover(isPresented: $showApp) {
            ContentView()
        }
    }
}

// MARK: - Subviews
private extension SplashView {
    var backgroundGradient: some View {
        DesignSystem.Colors.primaryGradient
            .opacity(DesignSystem.Opacity.light)
            .ignoresSafeArea()
    }
    
    var contentView: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            Spacer()
            mascotImage
            appNameText
            subtitleText
            Spacer()
            loadingIndicator
            Spacer()
                .frame(height: DesignSystem.Spacing.xxxl)
        }
        .padding(DesignSystem.Spacing.lg)
    }
    
    var mascotImage: some View {
        Image("fish-mascot")
            .resizable()
            .scaledToFit()
            .frame(
                width: DesignSystem.Size.mascotLg,
                height: DesignSystem.Size.mascotLg
            )
            .scaleEffect(isAnimating ? 1.0 : 0.5)
            .offset(y: isAnimating ? 0 : -20)
            .animation(
                .spring(
                    duration: DesignSystem.Animation.springDuration,
                    bounce: DesignSystem.Animation.springBounce
                ),
                value: isAnimating
            )
    }
    
    var appNameText: some View {
        Text("VerbKit")
            .font(DesignSystem.Typography.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(DesignSystem.Colors.primaryGradient)
            .opacity(isAnimating ? 1 : 0)
            .offset(y: isAnimating ? 0 : 10)
            .animation(
                .easeOut(duration: DesignSystem.Animation.slow)
                    .delay(DesignSystem.Animation.mediumDelay),
                value: isAnimating
            )
    }
    
    var subtitleText: some View {
        Text("Learn English Verbs")
            .font(DesignSystem.Typography.body)
            .foregroundColor(DesignSystem.Colors.textSecondary)
            .opacity(isAnimating ? 1 : 0)
            .animation(
                .easeOut(duration: DesignSystem.Animation.slow)
                    .delay(DesignSystem.Animation.longDelay),
                value: isAnimating
            )
    }
    
    var loadingIndicator: some View {
        ProgressView()
            .tint(DesignSystem.Colors.primary)
            .scaleEffect(1.2)
            .opacity(isAnimating ? 1 : 0)
            .animation(
                .easeOut(duration: DesignSystem.Animation.slow)
                    .delay(DesignSystem.Animation.longDelay),
                value: isAnimating
            )
    }
}

// MARK: - Actions
private extension SplashView {
    func handleAppearance() {
        isAnimating = true
        
        DispatchQueue.main.asyncAfter(
            deadline: .now() + DesignSystem.Animation.splashDelay
        ) {
            withAnimation {
                showApp = true
            }
        }
    }
}

#Preview {
    SplashView()
}
