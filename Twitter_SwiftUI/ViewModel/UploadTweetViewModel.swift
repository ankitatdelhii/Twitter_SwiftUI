//
//  UploadTweetViewModel.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 28/06/21.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    
    func uploadTweet(caption: String) {
        print("Upload tweet")
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = ["uid": user.id,
                                   "caption": caption,
                                   "fullname": user.fullName,
                                   "timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "likes": 0,
                                   "id": docRef.documentID
        ]
        
        docRef.setData(data) { _ in
            print("Successfully Uploaded Tweet.!")
        }
    }
    
}
