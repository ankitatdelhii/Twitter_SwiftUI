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
        
        let followingRef = COLLECTION_FOLLOWING.document(currentId).collection("user-following")
        let followerFef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        
        followingRef.document(user.id).setData([:]) { _ in
            followerFef.document(currentId).setData([:]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        guard let currentId = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentId).collection("user-following")
        let followerFef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        
        followingRef.document(user.id).delete { _ in
            followerFef.document(currentId).delete { _ in
                self.isFollowed = false
            }
        }
    }
    
}
