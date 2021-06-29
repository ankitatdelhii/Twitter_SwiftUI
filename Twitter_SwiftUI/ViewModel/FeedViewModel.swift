//
//  FeedViewModel.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 30/06/21.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    private func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { snapshot, _ in
            guard let documnets = snapshot?.documents else { return }
            self.tweets = documnets.map( {Tweet(dictionary: $0.data()) } )
        }
    }
    
}
