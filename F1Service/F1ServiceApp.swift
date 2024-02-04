//
//  F1ServiceApp.swift
//  F1Service
//
//  Created by Wishi on 30.08.2023.
//

import SwiftUI
import Firebase

@main
 struct F1ServiceApp: App {
          
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            Dashboard()
        }
    }
}
