//
//  TweetActionView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 01/07/21.
//

import SwiftUI

struct TweetActionView: View {
    
    let tweet: Tweet
    @ObservedObject var viewModel: TweetActionViewModel
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.viewModel = TweetActionViewModel(tweet: tweet)
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {}, label: {
                Image(systemName: "bubble.left")
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "arrow.2.squarepath")
                    .frame(width: 32, height: 32)
            })
            
            Spacer()
            
            Button(action: {
                viewModel.didLike ? viewModel.unlikeTweet() : viewModel.likeTweet()
            }, label: {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .frame(width: 32, height: 32)
                    .foregroundColor(viewModel.didLike ? .red : .gray)
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "bookmark")
                    .frame(width: 32, height: 32)
            })
        }.padding(.horizontal)
        .foregroundColor(.gray)
    }
}

