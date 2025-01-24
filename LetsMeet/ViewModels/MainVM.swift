//
//  MainVM.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import FirebaseAuth
import Foundation

class MainVM : ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.currentUserId = user?.uid ?? ""
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
