//
//  RegisterVM.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterVM: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var pwd = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        // Try login
        Auth.auth().createUser(withEmail: email, password: pwd) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)

        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !pwd.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email format."
            return false
        }
        
        let minLength = 8
        let uppercasePattern = ".*[A-Z]+.*"  // At least one uppercase letter
        let lowercasePattern = ".*[a-z]+.*"  // At least one lowercase letter
        let symbolPattern = ".*[!@#$%^&*(),.?\":{}|<>]+.*"  // At least one symbol
        
        guard pwd.count >= minLength && pwd.range(of: uppercasePattern, options: .regularExpression) != nil
                && pwd.range(of: lowercasePattern, options: .regularExpression) != nil
                && pwd.range(of: symbolPattern, options: .regularExpression) != nil else {
            errorMessage = "Pwd must be 8+ chars, contain uppercase, lowercase, symbol."
            return false
        }
        
        return true
        
    }
}

