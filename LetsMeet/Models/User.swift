//
//  User.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    var pfp: String?
    var bio: String?
    var myEvents: [String] = []
    var invitedEvents: [String] = []
}
