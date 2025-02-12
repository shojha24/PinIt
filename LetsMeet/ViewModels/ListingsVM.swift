//
//  ListingsVM.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import Foundation

class ListingsVM : ObservableObject {
    @Published var showingAddListing = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
}
