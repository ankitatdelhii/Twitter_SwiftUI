//
//  FeedView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 16/05/21.
//

import SwiftUI

struct FeedView: View {
    
    @State private var isShowingNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            ScrollView {
                VStack {
                    ForEach(0..<9) { _ in
                        TweetCell()
                    }
                }
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
                NewTweetView(isNewTweetShowing: $isShowingNewTweetView)
            })
            
        })
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
