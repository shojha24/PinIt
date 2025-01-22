//
//  LetsMeetApp.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import FirebaseCore
import SwiftUI

@main
struct LetsMeetApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
