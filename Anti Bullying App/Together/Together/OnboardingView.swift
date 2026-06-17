//
//  OnboardingView.swift
//  Together
//
//  Created by Fatoom Jamal on 06/05/2026.
//

import SwiftUI

// stage 1: Data Model For Every Page:
// This struct stores the data for each onboarding page

struct PageData {
    
    // Stores image name from Assets
    let image: String
    
    // Stores page title
    let title: String
    
    // Stores small description
    let description: String
    
    // Stores page color
    let pageColor: Color
}



//stage 2: Main Onboarding screen
struct OnboardingView: View {
    
    // Tracks current page number
    @State private var currentPage = 0
    
    // Used for logo animation on last page
    @State private var animateLogo = false
    
    
    // the background color #FEFCF3
    let backgroundColor = Color(
        red: 254/255,
        green: 252/255,
        blue: 243/255
    )
    
    
    //stage 3: the colors identifications:
    //pink color #CF71AF
    let pinkColor = Color(
        red: 207/255,
        green: 113/255,
        blue: 175/255
    )
    
    //purple color #A60054
    let customPurple = Color(
        red: 166/255,
        green: 0/255,
        blue: 84/255
    )
    
    //stage 4: the pages array, to have multiple pages with no need to create swift views:
    // Stores all onboarding pages
    let pages: [PageData]
    //intilize pages
    init() {
        
        // Create all onboarding pages
        pages = [
            
            // First page:
            
            PageData(
                
                // Custom image name
                image: "community",
                
                // Main title
                title: "Hello there!",
                
                // Description text
                description: "want a support and safe community ?",
                
                // Pink page color
                pageColor: Color(
                    red: 207/255,
                    green: 113/255,
                    blue: 175/255
                )
            ),
            
            // Second page:
            PageData(
                
                // Custom image name
                image: "connect",
                
                // Main title
                title: "Feel support",
                
                // Description text
                description: "learn, and feel supported by our community.",
                
                // Blue page color
                pageColor: Color(
                    red: 1/255,
                    green: 98/255,
                    blue: 239/255
                )
            ),
            
            //third page:
            PageData(
                
                // Custom image name
                image: "report1",
                
                // Main title
                title: "Stay Safe",
                
                // Description text
                description: "Report bullying and get support anytime.",
                
                // Green page color
                pageColor: Color(
                    red: 0/255,
                    green: 166/255,
                    blue: 82/255
                )
            )
        ]
    }
    //Stage 5:
    //Body:
    var body: some View {
    
    // Allows screen navigation
    NavigationStack {
        
        // Used to place layers on top of each other
        ZStack {
            //background color:
            (
                // First page background
                currentPage == 0
                
                ? Color(
                    red: 255/255,
                    green: 205/255,
                    blue: 0/255
                )
                
                // Second page background
                : currentPage == 1
                
                ? Color(
                    red: 1/255,
                    green: 98/255,
                    blue: 239/255
                )
                
                // Third page background
                : currentPage == 2
                
                ? Color(
                    red: 254/255,
                    green: 254/255,
                    blue: 253/255
                )
                
                // Last page background
                : backgroundColor
            )
            
            // Makes background fill entire screen
            .ignoresSafeArea()
            //main Vstack layout:
            VStack {
                
                Spacer()
                //last page
                if currentPage == 3 {
                    
                    // App logo image
                    Image("togetherLogo")
                    
                    // Allows resizing
                        .resizable()
                    
                    // Keeps image proportions correct
                        .scaledToFit()
                    
                    // Logo size
                        .frame(width: 250)
                    
                    // Zoom out effect
                        .scaleEffect(
                            animateLogo ? 1 : 1.5
                        )
                    // animation logo edits: Smooth animation
                        .animation(
                            .easeInOut(duration: 1),
                            value: animateLogo
                        )
                    
                    // Starts animation when page appears
                        .onAppear {
                            
                            animateLogo = true
                        }
                    
                    //under the loogo text
                    Text("Speak up, stay strong, stand together")
                    
                        .font(.headline)
                    
                        .fontWeight(.medium)
                    
                        .foregroundColor(.black)
                    
                        .multilineTextAlignment(.center)
                    
                        .padding(.top, 15)
                    //'Join' button
                    NavigationLink(
                        
                        destination: Text("Sign Up Screen")
                        
                    ) {
                        
                        Text("Join to start")
                        
                            .font(.headline)
                        
                            .foregroundColor(.white)
                        
                            .frame(
                                width: 220,
                                height: 55
                            )
                        
                        // Pink background
                            .background(pinkColor)
                        
                        // Rounded corners
                            .cornerRadius(15)
                    }
                    
                    .padding(.top, 30)
                    //'back' button
                    Button(action: {
                        
                        // Returns user to first page
                        currentPage = 0
                        
                    }) {
                        
                        Text("Back")
                        
                            .foregroundColor(.black)
                        
                            .padding(.top, 20)
                    }
                }
                
                //Stage 6: pages edits, images, text, etx...
                else {
                    //page image
                    Image(pages[currentPage].image)
                    
                        .resizable()
                    
                        .scaledToFit()
                    
                        .frame(width: 220)
                    //page title
                    Text(pages[currentPage].title)
                    
                        .font(.largeTitle)
                    
                        .bold()
                    
                    // Dynamic title colors
                        .foregroundColor(
                            
                            // Second page title
                            currentPage == 1
                            
                            ? Color(
                                red: 239/255,
                                green: 142/255,
                                blue: 1/255
                            )
                            
                            // Third page title
                            : currentPage == 2
                            
                            ? customPurple
                            
                            // First page title
                            : .black
                        )
                        .padding(.top)
                    //page discription:
                    Text(
                        pages[currentPage].description
                    )
                    
                    .font(.body)
                    
                    .multilineTextAlignment(.center)
                    
                    // Dynamic description colors
                    .foregroundColor(
                        
                        // Second page description
                        currentPage == 1
                        
                        ? .white
                        
                        // Third page description
                        : currentPage == 2
                        
                        ? .black
                        
                        // First page description
                        : .gray
                    )
                    
                    .padding()
                }
                Spacer()
                //pages navigator dots:
                HStack(spacing: 8) {
                    
                    // Creates 4 dots
                    ForEach(0..<4, id: \.self) { index in
                        
                        Circle()
                        
                        // Current page dot color
                            .fill(
                                
                                index == currentPage
                                
                                ? pages[
                                    min(currentPage, 2)
                                ].pageColor
                                
                                : Color.gray.opacity(0.3)
                            )
                        
                        // Dot size
                            .frame(
                                width: 10,
                                height: 10
                            )
                    }
                }
                //buttoms buttons
                if currentPage != 3 {
                    
                    HStack {
                        //skip button
                        Button("Skip") {
                            
                            // Jumps to last page
                            currentPage = 3
                        }
                        
                        .foregroundColor(.black)
                        
                        .padding()
                        
                        .frame(width: 120)
                        
                        .background(Color.white)
                        
                        .cornerRadius(12)
                        //next button
                        Button("Next") {
                            
                            // Goes to next page
                            if currentPage < 3 {
                                
                                currentPage += 1
                            }
                        }
                        
                        .foregroundColor(.white)
                        
                        .padding()
                        
                        .frame(width: 120)
                        
                        // Dynamic button colors
                        .background(
                            
                            // Second page button
                            currentPage == 1
                            ? Color(
                                red: 239/255,
                                green: 142/255,
                                blue: 1/255
                            )
                            
                            // Third page button
                            : currentPage == 2
                            
                            ? customPurple
                            
                            // First page button
                            : pages[currentPage].pageColor
                        )
                        
                        .cornerRadius(12)
                    }
                    
                    .padding(.bottom, 40)
                }
            }
                
                .padding()
            }
        }
    }
}

//preview: 

#Preview {
    
    OnboardingView()
}
                

