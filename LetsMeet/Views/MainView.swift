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
            ListingsView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
