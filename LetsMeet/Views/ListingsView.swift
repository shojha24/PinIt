//
//  ListingsView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import SwiftUI

struct ListingsView: View {
    @StateObject var viewModel = ListingsVM()
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Image(systemName: "magnifyingglass.circle.fill")
                                .foregroundColor(.letsOrange)
                                .font(.system(size: 14, weight: .medium))
                            Text("Search")
                                .foregroundColor(.letsOrange)
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .stroke(Color.letsOrange, lineWidth: 1)
                        )
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .foregroundColor(.letsOrange)
                                .font(.system(size: 14, weight: .medium))
                            Text("Filter")
                                .foregroundColor(.letsOrange)
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.white)
                                .stroke(Color.letsOrange, lineWidth: 1)
                        )
                    }
                    .padding(-14)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.letsOrange)
                                .font(.system(size: 14, weight: .medium))
                            Text("New Listing")
                                .foregroundColor(.letsOrange)
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding(6)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.letsOrange, lineWidth: 1)
                        )
                    }
                }
                
                
            }
            .navigationTitle("All Listings")
        }
    }
}

#Preview {
    ListingsView(userId: "")
}
