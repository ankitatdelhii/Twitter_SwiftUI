//
//  User.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 24/06/21.
//

import Foundation
import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullName: String
    let email: String
    var isCurrentUser: Bool { return self.id == Auth.auth().currentUser?.uid}
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullName = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
