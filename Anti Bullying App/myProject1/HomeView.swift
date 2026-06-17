//
//  HomeView.swift
//  myProject1
//
//  Created by Fatoom Jamal on 12/04/2026.
//HomeView.swift

//HomeView.swift

import SwiftUI

// This is the main home screen of the app
// It acts like a menu that lets the user navigate to different features
struct HomeView: View {
    var body: some View {
        
        // NavigationStack allows moving between different pages
        NavigationStack {
            
            ZStack {
                
                // Background design using gradient colors
                LinearGradient(
                    colors: [.blue.opacity(0.2), .white],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea() // makes background fill entire screen
                
                // Main content
                VStack(spacing: 25) {
                    
                    // App title
                    Text("Anti-Bullying Application")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.blue)
                    
                    // App icon (system image)
                    Image(systemName: "hand.raised.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(.blue)
                    
                    // Button to go to Learn screen
                    NavigationLink {
                        LearnView()
                    } label: {
                        Text("📘 Learn About Bullying")
                            .frame(maxWidth: .infinity) // full width button
                    }
                    .buttonStyle(.borderedProminent)
                    
                    // Button to go to Check screen
                    NavigationLink {
                        CheckView()
                    } label: {
                        Text("❓im i being bullied")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    // Button to go to Respond screen
                    NavigationLink {
                        RespondView()
                    } label: {
                        Text("🤔 How to Respond")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    
                    // Button to go to Help screen
                    NavigationLink {
                        HelpView()
                    } label: {
                        Text("🆘 Get Help")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding()
            }
        }
    }
}

// Preview for testing in Xcode
#Preview {
    HomeView()
}
