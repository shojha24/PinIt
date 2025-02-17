//
//  ListingItem.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import Foundation
import MapKit

struct ListingItem: Codable, Identifiable {
    let id: String
    let title : String
    let startDate : Double
    let ends : Bool
    let endDate : Double
    let description : String
    let latitude : Double
    let longitude : Double
    let profile : String
    let visible : Bool
    let capacity : String
    let spotsLeft : String
    let limitedCap : Bool
    var signUpList: [String] = []
    var inviteList: [String] = []
}
