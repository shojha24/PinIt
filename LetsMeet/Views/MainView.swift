//
//  MainView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainVM()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //signed in
            TabView(selection: $viewModel.currTab) {
                Tab("Listings", systemImage: "list.bullet.circle.fill", value: 0) {
                    ListingsView(userId: viewModel.currentUserId)
                }
                Tab("Map View", systemImage: "map.circle.fill", value: 1) {
                    MapView()
                }
                Tab("Profile", systemImage: "person.circle.fill", value: 2) {
                    ProfileView()
                }
            }
            .tint(.letsOrange)
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.light, for: .tabBar)
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
