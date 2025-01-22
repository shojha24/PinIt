//
//  Extensions.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/20/25.
//

import Foundation
import SwiftUI

extension Color {
    public static let letsOrange = Color(red: 230.0 / 255.0, green: 126.0 / 255.0, blue: 77.0 / 255.0, opacity: 1)
    public static let letsOrangeDark = Color(red: 40 / 255.0, green: 17 / 255.0, blue: 7 / 255.0, opacity: 1)
    
    //230, 126, 77
}

extension Encodable {
    func asDictionary() -> [String : Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
