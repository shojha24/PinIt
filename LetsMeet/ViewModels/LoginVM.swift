//
//  LoginVM.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import Foundation
import FirebaseAuth

class LoginVM : ObservableObject {
    @Published var email = ""
    @Published var pwd = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try login
        Auth.auth().signIn(withEmail: email, password: pwd)
        Auth.auth().signIn(withEmail: email, password: pwd) { authResult, error in
            if error != nil {
                // Handle the error
                self.errorMessage = "Sign in unsuccessful. Please try again."
                return
            }
        }
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
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
            errorMessage = "Pwd must be 8+ chars and contain 1 of each: uppercase, lowercase, symbol."
            return false
        }
        
        return true
        
    }
}
