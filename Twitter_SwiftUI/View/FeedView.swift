//
//  FeedView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 16/05/21.
//

import SwiftUI

struct FeedView: View {
    
    @State private var isShowingNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            ScrollView {
                VStack {
                    ForEach(viewModel.tweets) { eachTweet in
                        NavigationLink(destination: TweetDetailView(tweet: eachTweet) ) {
                            TweetCell(tweet: eachTweet)
                        }
                    }
                }.padding(.top)
            }
            
            Button(action: {
                isShowingNewTweetView.toggle()
            }, label: {
                Image("tweet")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView, content: {
                NewTweetView(isPresented: $isShowingNewTweetView)
            })
            
        })
    }
}

