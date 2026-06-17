//
//  HelpView.swift
//  myProject1
//
//  Created by Fatoom Jamal on 12/04/2026.
// HelpView.swift

import SwiftUI
import MapKit

// This screen helps the user in emergency situations
// It shows emergency numbers and a map with nearby police locations
struct HelpView: View {
    
    // Model representing each police station
    struct PoliceLocation: Identifiable {
        let id = UUID() // unique ID for SwiftUI lists
        let name: String
        let coordinate: CLLocationCoordinate2D
    }
    
    // This manages and provides the user's real-time location
    @StateObject private var locationManager = LocationManager()
    
    // Controls the map camera position (where the map is centered)
    @State private var mapPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 24.5, longitude: 54.5), // UAE center
            latitudinalMeters: 500000,
            longitudinalMeters: 500000
        )
    )
    
    // List of police stations across UAE
    let policeLocations: [PoliceLocation] = [
        PoliceLocation(name: "Dubai Police HQ", coordinate: CLLocationCoordinate2D(latitude: 25.2048, longitude: 55.2708)),
        PoliceLocation(name: "Abu Dhabi Police", coordinate: CLLocationCoordinate2D(latitude: 24.4539, longitude: 54.3773)),
        PoliceLocation(name: "Sharjah Police", coordinate: CLLocationCoordinate2D(latitude: 25.3463, longitude: 55.4209)),
        PoliceLocation(name: "Ajman Police", coordinate: CLLocationCoordinate2D(latitude: 25.4052, longitude: 55.5136)),
        PoliceLocation(name: "Ras Al Khaimah Police", coordinate: CLLocationCoordinate2D(latitude: 25.7895, longitude: 55.9432)),
        PoliceLocation(name: "Fujairah Police", coordinate: CLLocationCoordinate2D(latitude: 25.1288, longitude: 56.3265)),
        PoliceLocation(name: "Umm Al Quwain Police", coordinate: CLLocationCoordinate2D(latitude: 25.5647, longitude: 55.5552))
    ]
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            // Title
            Text("CALL If you need help")
                .font(.largeTitle)
                .bold()
            
            // Phone icon for visual meaning
            Image(systemName: "phone.fill")
                .font(.system(size: 60))
                .foregroundStyle(.green)
            
            // Emergency instructions
            Text("If you are in danger, contact emergency services:")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            // UAE emergency number
            Text("UAE: 999")
                .font(.title2)
                .bold()
            
            // International emergency number
            Text("International: 911")
                .font(.title2)
                .bold()
            
            // Map showing police stations + user location
            Map(position: $mapPosition, interactionModes: [.all]) {
                
                // Show all police stations as markers
                ForEach(policeLocations) { place in
                    Marker(place.name,
                           systemImage: "shield.fill",
                           coordinate: place.coordinate)
                        .tint(.blue)
                }
                
                // Show user location if available
                if let userLocation = locationManager.userLocation {
                    Marker("You",
                           systemImage: "person.fill",
                           coordinate: userLocation)
                        .tint(.red)
                }
            }
            .frame(height: 250)
            .cornerRadius(15)
            
            // Map style settings (realistic + traffic + points of interest)
            .mapStyle(.standard(
                elevation: .realistic,
                pointsOfInterest: [.airport, .atm, .bank],
                showsTraffic: true
            ))
            
            // Map controls (zoom, compass, location button)
            .mapControls {
                MapPitchToggle()
                MapCompass()
                MapUserLocationButton()
            }
            
            // Listen for location updates and move map to user
            .onReceive(locationManager.$userLocation) { location in
                if let location = location {
                    withAnimation {
                        mapPosition = .region(
                            MKCoordinateRegion(
                                center: location,
                                latitudinalMeters: 5000,
                                longitudinalMeters: 5000
                            )
                        )
                    }
                }
            }
            
            // Final message encouraging user to seek help
            Text("You must not hesitate to reach out for help. Contact a trusted person or a family member immediately.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

// Preview for testing
#Preview {
    HelpView()
}
