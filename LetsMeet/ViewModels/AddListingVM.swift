//
//  AddListingVM.swift
//  LetsMeet
//
//  Created by Sharabh Ojha on 1/19/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import MapKit

class AddListingVM : ObservableObject {
    @Published var title : String = "" // done
    @Published var startDate : Date = Date() // done
    @Published var endRequired : Bool = false
    @Published var endDate : Date = Date() 
    @Published var description : String = "" // done
    @Published var location : CLLocationCoordinate2D = CLLocationCoordinate2D()
    @Published var visible : Bool = true // done
    @Published var capacity : String = "" // done
    @Published var limitedCap : Bool = false // done
    @Published var errorMessage : String = ""
    @Published var showAlert : Bool = false
    
    init () {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        if (!visible) {
            limitedCap = false
        }
        
        if (!limitedCap) {
            capacity = ""
        }
        
        if (!endRequired) {
            endDate = Date()
        }
        
        let newId = UUID().uuidString
        let newListing = ListingItem(
            id: newId,
            title: title,
            startDate: startDate,
            ends: endRequired,
            endDate: endDate,
            description: description,
            latitude: location.latitude,
            longitude: location.longitude,
            profile: uId,
            visible: visible,
            capacity: capacity,
            spotsLeft: capacity,
            limitedCap: limitedCap
        )
        
        let db = Firestore.firestore()
        db.collection("events")
            .document(newId)
            .setData(newListing.asDictionary())
        
        let userRef = db.collection("users").document(uId)
        
        userRef.updateData([
            "myEvents": FieldValue.arrayUnion([newId])
        ])
        
    }
    
    var canSave: Bool {
        errorMessage = ""
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty, !description.trimmingCharacters(in: .whitespaces).isEmpty, !(location.latitude == CLLocationCoordinate2D().latitude), !(location.longitude == CLLocationCoordinate2D().longitude) else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard !endRequired || (endDate >= startDate) else {
            errorMessage = "End date must be after start date"
            return false
        }
        
        if visible && limitedCap {
            if capacity.trimmingCharacters(in: .whitespaces).isEmpty {
                errorMessage = "Capacity is required"
                return false
            }
                
            if let capacityValue = Int(capacity) {
                if capacityValue <= 0 {
                    errorMessage = "Capacity must be a positive number"
                    return false
                }
            } else {
                errorMessage = "Capacity must be a number"
                return false
                }
        }
        
        return true
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

   
    
    var statusString: String {
        guard let status = locationStatus else {
            return "unknown"
        }
        
        switch status {
        case .notDetermined: return "notDetermined"
        case .authorizedWhenInUse: return "authorizedWhenInUse"
        case .authorizedAlways: return "authorizedAlways"
        case .restricted: return "restricted"
        case .denied: return "denied"
        default: return "unknown"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print(#function, location)
    }
}
