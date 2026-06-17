//
//  RespondView.swift
//  myProject1
//
//  Created by Fatoom Jamal on 12/04/2026.
// RespondView.swift

import SwiftUI

// This screen gives advice based on different bullying situations
// The user taps a situation and receives guidance on what to do
struct RespondView: View {
    
    // This stores the message shown to the user
    // It changes depending on which button is pressed
    @State var message = "Tap a situation to get advice"
    
    var body: some View {
        
        ZStack {
            
            // Background gradient design
            LinearGradient(
                colors: [.blue.opacity(0.2), .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Main content
            VStack(spacing: 25) {
                
                // Title
                Text("How to act to stop bullying")
                    .font(.largeTitle)
                    .bold()
                
                // Dynamic message area (updates when buttons are tapped)
                Text(message)
                    .font(.title3)
                    .foregroundStyle(.black)
                    .padding()
                
                // Situation 1: verbal bullying
                Button("Someone is insulting me") {
                    message = "Stay calm and do not react. Walk away and tell a trusted person."
                }
                .buttonStyle(.borderedProminent)
                
                // Situation 2: online bullying
                Button("Someone is bullying me online") {
                    message = "Block the person and report them. Do not reply."
                }
                .buttonStyle(.borderedProminent)
                
                // Situation 3: feeling unsafe
                Button("I feel unsafe") {
                    message = "Seek help immediately from a teacher or trusted adult, or go to the Help page to contact emergency services or find the nearest police station."
                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding()
        }
    }
}

// Preview for testing
#Preview {
    RespondView()
}
