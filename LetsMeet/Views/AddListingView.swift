//
//  AddListingView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import SwiftUI
import MapKit
import MapItemPicker

struct AddListingView: View {
    @StateObject var viewModel = AddListingVM()
    @StateObject var locationModel = LocationManager()
    
    init(userId: String) {
        viewModel.profile = userId
        viewModel.location = locationModel.lastLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 37.333747, longitude: -122.011448)
    }
    
    var body: some View {
        VStack {
                Text("New Listing")
                    .font(.system(size: 32))
                    .bold()
                
                Form {
                    // Title
                    TextField("Title", text: $viewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TextField("Description", text: $viewModel.description, axis: .vertical)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Picker("Visibility", selection: $viewModel.visible) {
                        Text("Public").tag(true)
                        Text("Private").tag(false)
                    }
                    .pickerStyle(.segmented)
                    
                    if (viewModel.visible) {
                        Toggle("Unlimited spots?", isOn: $viewModel.unlimitedCap)
                            .toggleStyle(.switch)
                    }
                    
                    if (!viewModel.unlimitedCap) {
                        TextField("Number of spots available", text: $viewModel.capacity)
                                    .keyboardType(.decimalPad)
                    }
                    
                    DatePicker("Due Date", selection: $viewModel.date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                }
        }
    }
}

#Preview {
    AddListingView(userId: "")
}
