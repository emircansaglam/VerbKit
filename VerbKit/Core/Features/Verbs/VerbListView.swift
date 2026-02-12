//
//  VerbListView.swift
//  VerbKit
//
//  Created by emircan.saglam on 9.02.2026.
//

import SwiftUI

struct VerbListView: View {
    @StateObject private var viewModel = VerbListViewModel()
    @State private var isHeaderVisible: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                DesignSystem.Colors.background
                    .ignoresSafeArea()
                
                scrollContent
            
                // Overlay header
                floatingHeader
                    .opacity(isHeaderVisible ? 1 : 0)
                    .offset(y: isHeaderVisible ? 0 : -80)
                    .animation(.easeInOut(duration: 0.25), value: isHeaderVisible)
            }
            .verbKitNavigationBar(title: "Verbs")
        }
    }
}

// MARK: - Subviews
private extension VerbListView {
    var floatingHeader: some View {
        VStack(spacing: DesignSystem.Spacing.sm) {
            searchBar
            categoryFilterBar
        }
        .padding(.top, DesignSystem.Spacing.sm)
        .padding(.bottom, DesignSystem.Spacing.xs)
        .background(DesignSystem.Colors.background)
    }
    
    var scrollContent: some View {
        ScrollView {
            LazyVStack(spacing: DesignSystem.Spacing.md) {
                // Header yüksekliği kadar boşluk
                Color.clear.frame(height: 70)
                
                // Visibility tracker - bu kaybolunca header gizlenir
                visibilityTracker
                
                ForEach(viewModel.filteredVerbs) { verb in
                    VerbCard(verb: verb)
                        .padding(.horizontal, DesignSystem.Spacing.screenEdge)
                }
            }
            .padding(.bottom, DesignSystem.Spacing.xxxl)
        }
        .scrollIndicators(.hidden)
    }
    
    // Bu view ekrandan çıkınca header kaybolur
    var visibilityTracker: some View {
        GeometryReader { geo in
            Color.clear
                .onChange(of: geo.frame(in: .global).minY) { minY in
                    withAnimation(.easeInOut(duration: 0.25)) {
                        isHeaderVisible = minY > 100
                    }
                }
        }
        .frame(height: 1)
    }
    
    var searchBar: some View {
        HStack(spacing: DesignSystem.Spacing.sm) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(DesignSystem.Colors.textSecondary)
                .font(.subheadline)
            
            TextField("Search verbs...", text: $viewModel.searchText)
                .font(DesignSystem.Typography.subheadline)
            
            if !viewModel.searchText.isEmpty {
                Button {
                    viewModel.searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(DesignSystem.Colors.textSecondary)
                        .font(.subheadline)
                }
            }
        }
        .padding(.horizontal, DesignSystem.Spacing.md)
        .padding(.vertical, DesignSystem.Spacing.sm)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.md))
        .shadow(
            color: DesignSystem.Shadow.xs.color,
            radius: DesignSystem.Shadow.xs.radius,
            y: DesignSystem.Shadow.xs.y
        )
        .padding(.horizontal, DesignSystem.Spacing.screenEdge)
    }
    
    var categoryFilterBar: some View {
        CategoryFilterBar(selectedCategory: $viewModel.selectedCategory)
    }
}

#Preview {
    VerbListView()
}
