//
//  ProfileViewModel.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 27/06/21.
//

import SwiftUI
import Firebase

class ProfileViewModel: ObservableObject {
    
    @Published var user: User
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserTweets()
        fetchLikedTweets()
        fetchUserStats()
    }
    
    func tweets(forFilter filter: TweetFilterOptions) -> [Tweet] {
        switch filter {
        case .tweets:
            return userTweets
        case .likes:
            return likedTweets
        }
    }
    
}

//MARK: - API

extension ProfileViewModel {
    
    func follow() {
        guard let currentId = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentId).collection("user-following")
        let followerFef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        
        followingRef.document(user.id).setData([:]) { _ in
            followerFef.document(currentId).setData([:]) { _ in
                self.user.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        guard let currentId = Auth.auth().currentUser?.uid else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentId).collection("user-following")
        let followerFef = COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers")
        
        followingRef.document(user.id).delete { _ in
            followerFef.document(currentId).delete { _ in
                self.user.isFollowed = false
            }
        }
    }
    
    func checkIfUserIsFollowed() {
        guard let currentId = Auth.auth().currentUser?.uid else { return }
        guard !user.isCurrentUser else { return }
        
        let followingRef = COLLECTION_FOLLOWING.document(currentId).collection("user-following")
        followingRef.document(user.id).getDocument { snapshot, _ in
            guard let isUserFolllowed = snapshot?.exists else { return }
            self.user.isFollowed = isUserFolllowed
        }
    }
    
    func fetchUserTweets() {
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.userTweets = documents.map({ Tweet(dictionary: $0.data()) })
            print("View Loaded")
        }
    }
    
    func fetchLikedTweets() {
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let tweetIds = documents.map({ $0.documentID })
            
            tweetIds.forEach { id in
                COLLECTION_TWEETS.document(id).getDocument { idSnapshot, _  in
                    guard let data = idSnapshot?.data() else { return }
                    let tweet = Tweet(dictionary: data)
                    print("Liked Tweets are \(tweet)")
                    self.likedTweets.append(tweet)
                }
            }
        }
    }
    
    func fetchUserStats() {
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        let followingRef = COLLECTION_FOLLOWING.document(user.id).collection("user-following")
        
        followersRef.getDocuments { snapshot , _ in
            guard let followersCount = snapshot?.documents.count else { return }
            
            followingRef.getDocuments { snapshot, _ in
                guard let followingCount = snapshot?.documents.count else { return }
                let stats = UserStats(followers: followersCount, following: followingCount)
                
                self.user.stats = stats
            }
        }
    }
    
}
