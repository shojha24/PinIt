//
//  AddListingView.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import SwiftUI
import MapKit

struct AddListingView: View {
    @StateObject var viewModel = AddListingVM()
    @StateObject var locationModel = LocationManager()
    @State private var annotation : MKPointAnnotation = MKPointAnnotation()
    @Binding var addListingPresented: Bool
    
    var body: some View {
                
        let startPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: locationModel.lastLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 34.071, longitude: -118.4448),
                span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            )
        )
        
        VStack {
            
                Text("New Listing")
                    .padding(20)
                    .font(.system(size: 32))
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color.letsOrange)
                    .foregroundColor(.white)
                    
                
                Form {
                    // Title
                    TextField("Title", text: $viewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TextField("Description; who what where when why", text: $viewModel.description, axis: .vertical)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Picker("Visibility", selection: $viewModel.visible) {
                        Text("Public").tag(true)
                        Text("Private").tag(false)
                    }
                    .pickerStyle(.segmented)
                    
                    if (viewModel.visible) {
                        Toggle("Limited attendance?", isOn: $viewModel.limitedCap)
                            .toggleStyle(.switch)
                            .tint(.letsOrange)
                    }
                    
                    if (viewModel.visible && viewModel.limitedCap) {
                        TextField("Number of spots available", text: $viewModel.capacity)
                                    .keyboardType(.decimalPad)
                    }
                    
                    DatePicker("Starts:", selection: $viewModel.startDate, in: Date()...)
                        .datePickerStyle(CompactDatePickerStyle())
                        .tint(.letsOrange)
                    
                    Toggle("Ending date/time?", isOn: $viewModel.endRequired)
                        .toggleStyle(.switch)
                        .tint(.letsOrange)
                    
                    if (viewModel.endRequired) {
                        DatePicker("Ends:", selection: $viewModel.endDate, in: Date()...)
                            .datePickerStyle(CompactDatePickerStyle())
                            .tint(.letsOrange)
                    }
                    
                    Text("Add a pin on the event location. Drag to move, pinch to zoom.")
                        .frame(maxWidth: .infinity, maxHeight: 70)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 14))
                        .foregroundColor(Color.letsOrangeDark)

                    MapReader { proxy in
                        Map(initialPosition: startPosition) {
                            Annotation("Here", coordinate: viewModel.location) {
                                Image(systemName: "mappin")
                                    .resizable()
                                    .frame(width: 12, height: 32)
                                    .foregroundColor(.letsOrange)
                            }
                        }
                            .frame(width: 350, height: 350)
                            .cornerRadius(25)
                            .onTapGesture { position in
                                if let coordinate = proxy.convert(position, from: .local) {
                                    print("Tapped at \(coordinate)")
                                    viewModel.location = coordinate
                                }
                            }
                    }
                    
                    Button(action: {
                        if viewModel.canSave {
                            viewModel.showAlert = false
                            viewModel.save()
                            addListingPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }) {
                        Text("Let's Go!")
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.letsOrange)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.letsOrange, lineWidth: 3)
                            )
                    }
                    
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Item not added"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                }
        }
    }
}

#Preview {
    AddListingView(addListingPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
