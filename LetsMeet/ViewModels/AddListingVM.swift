//
//  AddListingVM.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import Foundation

class AddListingVM : ObservableObject {
    @Published var title : String = ""
    @Published var date : Date = Date()
    @Published var description : String = ""
    @Published var location : String = ""
    @Published var profile : String = ""
    @Published var visible : Bool = true
    @Published var capacity : Int = 0
    @Published var unlimitedCap : Bool = true
    
    init () {
        
    }
}
