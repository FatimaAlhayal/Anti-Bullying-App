//
//  LearnView.swift
//  myProject1
//
//  Created by Fatoom Jamal on 12/04/2026.
// LearnView.swift

import SwiftUI

// This screen teaches the user what bullying is
// It provides simple information and a link to UAE law
struct LearnView: View {
    var body: some View {
        
        ZStack {
            
            // Background gradient for soft visual design
            LinearGradient(
                colors: [.blue.opacity(0.2), .white],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea() // fills entire screen
            
            VStack(spacing: 20) {
                
                // Title
                Text("What is Bullying?")
                    .font(.largeTitle)
                    .bold()
                
                // Warning icon to represent seriousness
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(.orange)
                
                // Card-style container for information
                ZStack {
                    
                    // White rounded card background
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .shadow(radius: 5)
                        .frame(height: 250)
                    
                    // Text content inside the card
                    VStack(spacing: 10) {
                        Text("Bullying is repeated harmful behavior.")
                        Text("It can be physical, verbal, or online.")
                        Text("It affects mental health and confidence.")
                    }
                    .font(.headline)
                    .padding()
                }
                
                // Button that opens UAE law website in browser
                Link("What does the law say?", destination: URL(string: "https://uaelegislation.gov.ae/ar/legislations/2131")!)
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 10)
                
            }
            .padding()
        }
    }
}

// Preview for Xcode canvas
#Preview {
    LearnView()
}
