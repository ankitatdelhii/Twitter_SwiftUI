//
//  AuthViewModel.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 22/06/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User? // To Observe signed in user
    @Published var isAuthenticating = false // To observe to show loader
    @Published var error: Error? // To observe to show toast
    @Published var user: User? // To observe our Custom user
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Errro logging in \(error.localizedDescription)")
                return
            }
            print("Successfully Logged in")
            self.userSession = result?.user
        }
    }
    
    func registerUser(email: String, password: String, username: String, fullName: String, profileImage: UIImage) {
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Failed to upload image \(error.localizedDescription)")
                return
            }
            print("Successfully Uploaded your photo")
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("Errro is registration \(error)")
                        return
                    }
                    print("Registration Done!")
                    
                    guard let user = result?.user else { return }
                    
                    let data = ["email" : email,
                                "username" : username.lowercased(),
                                "fullname" : fullName,
                                "profileImageUrl" : profileImageUrl,
                                "uid" : user.uid
                    ]
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("Successfully uploaded User Data")
                        self.userSession = result?.user
                    }
                }
                
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
