//
//  AddListingView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import SwiftUI
import MapKit
import LocationPicker


struct AddListingView: View {
    @StateObject var viewModel = AddListingVM()
    
    init(userId: String) {
        viewModel.profile = userId
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
                                
                DatePicker("Due Date", selection: $viewModel.date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                
            }
        }
    }
}

#Preview {
    AddListingView(userId: "")
}
