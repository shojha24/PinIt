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
    let startDate : Date
    let ends : Bool
    let endDate : Date
    let description : String
    let latitude : Double
    let longitude : Double
    let profile : String
    let visible : Bool
    let capacity : String
    let spotsLeft : String
    let limitedCap : Bool
}
