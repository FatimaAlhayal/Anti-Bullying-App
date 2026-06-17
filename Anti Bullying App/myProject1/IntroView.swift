//
//  IntroView.swift
//  myProject1
//
//  Created by Fatoom Jamal on 04/05/2026.
//

import SwiftUI
import SwiftData

// This is the first screen the user sees
// It collects basic user information before entering the app
struct IntroView: View {
    
    // These variables store user input temporarily while typing
    @State private var name = ""
    @State private var age = ""
    @State private var level: Double = 50   // slider value (bullying level)
    @State private var contact = ""
    
    // This connects to SwiftData so we can save user info
    @Environment(\.modelContext) private var modelContext
    
    // This is used if we want to dismiss the current screen later
    @Environment(\.dismiss) var dismiss
    
    // This controls navigation to the Home screen after saving
    @State private var goToHome = false
    
    var body: some View {
        
        // NavigationStack allows movement between screens
        NavigationStack {
            
            // Main layout (vertical)
            VStack(spacing: 20) {
                
                
                
                // Title text
                Text("Please sign-in to start")
                    .font(.largeTitle)
                    .bold()
                
                // Input field for name
                TextField("Enter your name", text: $name)
                    .textFieldStyle(.roundedBorder)
                
                // Input field for age
                TextField("Enter your age", text: $age)
                    .textFieldStyle(.roundedBorder)
                
                // Slider showing how the user feels (bullying level)
                Text("Bullying Level you feel: \(Int(level))")
                Slider(value: $level, in: 0...100)
                
                // Emergency contact input
                TextField("Emergency Contact", text: $contact)
                    .textFieldStyle(.roundedBorder)
                
                // Button to save data and move to next screen
                Button("Save & Continue") {
                    
                    // Create a new User object with entered data
                    let user = User(
                        name: name,
                        age: age,
                        level: level,
                        emergencyContact: contact
                    )
                    
                    // Save user into database (SwiftData)
                    modelContext.insert(user)
                    
                    // Trigger navigation to Home screen
                    goToHome = true
                }
                .buttonStyle(.borderedProminent)
                
                // Hidden navigation link that activates when goToHome becomes true
                NavigationLink("", destination: ContentView(), isActive: $goToHome)
                    .hidden()
                
            }
            .padding()
        }
    }
}

// Preview for Xcode canvas
#Preview {
    IntroView()
}
