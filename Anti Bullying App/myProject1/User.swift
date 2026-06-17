//
//  User.swift
//  myProject1
//
//  Created by Fatoom Jamal on 04/05/2026.
// User.swift

import Foundation
import SwiftData

// This is a data model that represents a user in the app
// It defines what information is saved in the database
@Model
class User {
    
    // User's basic information
    var name: String            // stores user's name
    var age: String             // stores user's age (as text)
    
    // How the user feels about bullying (slider value)
    var level: Double
    
    // Emergency contact number or person
    var emergencyContact: String
    
    // Initializer used when creating a new user
    init(name: String, age: String, level: Double, emergencyContact: String) {
        self.name = name
        self.age = age
        self.level = level
        self.emergencyContact = emergencyContact
    }
}
