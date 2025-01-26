//
//  MainVM.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class MainVM : ObservableObject {
    @Published var currentUserId: String = ""
    @Published var currTab: Int = 0
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            if let uid = user?.uid {
                self.verifyUserExistsInDatabase(uid: uid)
            } else {
                self.currentUserId = ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    private func verifyUserExistsInDatabase(uid: String) {
        // Assume we use Firestore for the user database
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument { [weak self] (document, error) in
            guard let self = self else { return }
            if let document = document, document.exists {
                self.currentUserId = uid
            } else {
                self.signOutAndClearState()
            }
        }
    }

    private func signOutAndClearState() {
        do {
            try Auth.auth().signOut()
            self.currentUserId = ""
        } catch let error {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
