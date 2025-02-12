//
//  ListingsView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import SwiftUI
import FirebaseFirestore
import MapKit

struct ListingsView: View {
    @StateObject var viewModel: ListingsVM
    @FirestoreQuery var items: [ListingItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "events")
        
        self._viewModel = StateObject(wrappedValue: ListingsVM(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if items.isEmpty {
                    ProgressView()
                } else {
                    List(items) { item in
                        //Text(item.title)
                        //    .foregroundColor(.letsOrange)
                        ListingItemView(title: item.title, username: item.profile, address: "test", startDate: Date(timeIntervalSince1970: item.startDate), endDate: Date(timeIntervalSince1970: item.endDate))
                    }
                    .listStyle(PlainListStyle())
                }

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
                        viewModel.showingAddListing = true
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
            .sheet(isPresented: $viewModel.showingAddListing) {
                AddListingView(addListingPresented: $viewModel.showingAddListing)
            }
        }
    }
}

#Preview {
    ListingsView(userId: "")
}
