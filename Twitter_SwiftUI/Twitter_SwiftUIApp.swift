//
//  Twitter_SwiftUIApp.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 15/05/21.
//

import SwiftUI
import Firebase

@main
struct Twitter_SwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
