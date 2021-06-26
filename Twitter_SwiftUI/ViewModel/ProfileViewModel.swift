//
//  ProfileViewModel.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 27/06/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    let user: User
    @Published var isFollowed = false
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let currentId = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentId).collection("user-following").document(user.id).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currentId).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        
    }
    
}
