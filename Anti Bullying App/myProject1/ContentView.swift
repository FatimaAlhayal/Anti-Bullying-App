//
//  ContentView.swift
//  myProject1
//
//  Created by Fatoom Jamal on 12/04/2026.
// ContentView.swift

import SwiftUI

// This is the main container of the app
// It uses a TabView to switch between main sections (like a bottom menu)
struct ContentView: View {
    var body: some View {
        
        // TabView creates a tab bar at the bottom of the screen
        TabView {
            
            // First tab: Home screen
            HomeView()
                .tabItem {
                    // Icon for the tab
                    Image(systemName: "house.fill")
                    
                    // Text label under the icon
                    Text("Home")
                }
            
            // Second tab: Profile screen
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

// Preview for testing
#Preview {
    ContentView()
}
