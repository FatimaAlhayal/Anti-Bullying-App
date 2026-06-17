//
//  myProject1App.swift
//  myProject1
//
//  Created by Fatoom Jamal on 12/04/2026.
import SwiftUI

@main
struct myProject1App: App {
    
    init() {
        NotificationManager.shared.requestPermission()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
