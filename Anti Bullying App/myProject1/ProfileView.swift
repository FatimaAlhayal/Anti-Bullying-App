//
//  ProfileView.swift
//  myProject1
//
//  Created by Fatoom Jamal on 12/04/2026.
// ProfileView.swift

import SwiftUI
import SwiftData

// This screen shows the user's saved profile information
// It reads data from SwiftData and displays it in a clean card format
struct ProfileView: View {
    
    // Fetch all saved users from SwiftData
    // This automatically updates the UI when data changes
    @Query private var users: [User]
    
    var body: some View {
        
        ZStack {
            
            // Background gradient for consistent app design
            LinearGradient(
                colors: [.blue.opacity(0.2), .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                // Page title
                Text("Profile")
                    .font(.largeTitle)
                    .bold()
                
                // Profile icon
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 70))
                    .foregroundStyle(.blue)
                
                // Check if user data exists
                // If yes, show it inside a card
                if let user = users.first {
                    
                    ZStack {
                        
                        // White card background
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .shadow(radius: 5)
                            .frame(height: 250)
                        
                        // User information display
                        VStack(spacing: 10) {
                            Text("Name: \(user.name)")
                            Text("Age: \(user.age)")
                            Text("Bullying Level: \(Int(user.level))")
                            Text("Emergency Contact: \(user.emergencyContact)")
                        }
                        .font(.headline)
                    }
                    
                } else {
                    // If no user is saved yet
                    Text("No user data found")
                        .foregroundStyle(.gray)
                }
                
            }
            .padding()
        }
    }
}

// Preview for testing
#Preview {
    ProfileView()
}
