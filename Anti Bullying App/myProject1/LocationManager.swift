//
//  LocationManager.swift
//  myProject1
//
//  Created by Fatoom Jamal on 27/04/2026.
// LocationManager.swift

import Foundation
import CoreLocation
import Combine

// This class is responsible for getting the user's real GPS location
// It continuously listens for location updates from the device
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // Core Location manager that handles GPS tracking
    private let manager = CLLocationManager()
    
    // Published value so SwiftUI views can react when location changes
    @Published var userLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        // Set this class as the delegate to receive location updates
        manager.delegate = self
        
        // Ask for highest accuracy (good for maps)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Ask user for permission to access location
        manager.requestWhenInUseAuthorization()
        
        // Start tracking the user's location
        manager.startUpdatingLocation()
    }
    
    // This function is called automatically when location updates happen
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Get the most recent location from the list
        guard let location = locations.last else { return }
        
        // Update UI on the main thread (important for SwiftUI)
        DispatchQueue.main.async {
            self.userLocation = location.coordinate
        }
    }
}
