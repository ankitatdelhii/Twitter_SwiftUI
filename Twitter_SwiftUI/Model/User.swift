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
    var stats: UserStats
    var isFollowed: Bool
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullName = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        // We will assign Stats from separate API Call. That's why setting to 0 here
        self.stats = UserStats.init(followers: 0, following: 0)
        self.isFollowed = false
    }
}

struct UserStats {
    let followers: Int
    let following: Int
}
