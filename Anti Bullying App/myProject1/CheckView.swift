//
//  CheckView.swift
//  myProject1
//
//  Created by Fatoom Jamal on 12/04/2026.
// CheckView.swift

import SwiftUI

struct CheckView: View {
    
    // Each question has its own risk slider value
    @State private var q1: Double = 50
    @State private var q2: Double = 50
    @State private var q3: Double = 50
    @State private var q4: Double = 50
    @State private var q5: Double = 50
    
    // Message shown to user
    @State private var message = "Answer the questions below"
    
    // Prevent multiple notifications spam
    @State private var hasNotified = false
    
    var body: some View {
        
        ZStack {
            
            // Background
            LinearGradient(
                colors: [.blue.opacity(0.2), .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView {
                
                VStack(spacing: 25) {
                    
                    Text("Bullying Risk Check")
                        .font(.largeTitle)
                        .bold()
                    
                    Text(message)
                        .font(.title3)
                        .foregroundStyle(.blue)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    // QUESTION 1
                    VStack {
                        Text("1. Do you feel unsafe at school/collage?")
                        Slider(value: $q1, in: 0...100)
                        Text("Level: \(Int(q1))")
                    }
                    
                    // QUESTION 2
                    VStack {
                        Text("2. Are you being insulted by others?")
                        Slider(value: $q2, in: 0...100)
                        Text("Level: \(Int(q2))")
                    }
                    
                    // QUESTION 3
                    VStack {
                        Text("3. Are you being excluded or ignored and not accepted by others?")
                        Slider(value: $q3, in: 0...100)
                        Text("Level: \(Int(q3))")
                    }
                    
                    // QUESTION 4
                    VStack {
                        Text("4. Do you feel stressed or afraid  of others?")
                        Slider(value: $q4, in: 0...100)
                        Text("Level: \(Int(q4))")
                    }
                    
                    // QUESTION 5
                    VStack {
                        Text("5. Are you afraid to go to school/collage?")
                        Slider(value: $q5, in: 0...100)
                        Text("Level: \(Int(q5))")
                    }
                    
                    // CHECK BUTTON
                    Button("Check Risk Level") {
                        
                        let values = [q1, q2, q3, q4, q5]
                        
                        // Check if ANY answer is dangerous
                        if values.contains(where: { $0 >= 65 }) {
                            
                            message = "⚠️ this level is not safe. Please seek help,go to -Get help section-"
                            
                            // Send notification only once
                            if !hasNotified {
                                NotificationManager.shared.sendNotification(
                                    title: "High Risk Alert",
                                    body: "One or more answers indicate bullying risk. Go to Help section for support."
                                )
                                
                                hasNotified = true
                            }
                            
                        } else {
                            message = "✅ Your risk level seems safe, but stay aware."
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Text("For help, go to HelpView to find emergency contacts and police stations.")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                }
                .padding()
            }
        }
        .onAppear {
            NotificationManager.shared.requestPermission()
        }
    }
}

#Preview {
    CheckView()
}
