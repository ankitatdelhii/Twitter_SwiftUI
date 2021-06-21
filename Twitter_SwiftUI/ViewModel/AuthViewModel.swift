//
//  AuthViewModel.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 22/06/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    func registerUser(email: String, password: String, username: String, fullName: String, profileImage: UIImage) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Errro is registration \(error)")
                return
            }
            print("Registration Done!")
        }
    }
    
}
