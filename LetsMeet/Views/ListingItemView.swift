//
//  ListingItemView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import SwiftUI

struct ListingItemView: View {
    let title: String
    let username: String
    let address: String
    let startDate: Date
    let endDate: Date?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Title
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            // Username
            Text(username)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
            
            // Address
            Text("Address: \(address)")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
            
            // Start and End Time
            Text(formattedDateRange(startDate: startDate, endDate: endDate))
                .font(.caption)
                .foregroundColor(.white.opacity(0.9))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.letsOrange)
        .cornerRadius(10)
    }
    
    // Helper function to format date range
    private func formattedDateRange(startDate: Date, endDate: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a M/dd/yy"
        
        if let endDate = endDate {
            if endDate > startDate {
                return "\(dateFormatter.string(from: startDate)) - \(dateFormatter.string(from: endDate))"
            }
        }
        return dateFormatter.string(from: startDate)
    }
}

#Preview {
    ListingItemView(
            title: "Title #1",
            username: "Username",
            address: "507 Gardenia Way",
            startDate: Date(timeIntervalSince1970: 761100660), // Example timestamp
            endDate: Date(timeIntervalSince1970: 761104860)   // Example timestamp
        )
}

