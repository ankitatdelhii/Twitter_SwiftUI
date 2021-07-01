//
//  TweetCell.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 16/05/21.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top) {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4.0, content: {
                    HStack(alignment: .center) {
                        Text(tweet.fullName)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Text("@\(tweet.username) •")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color.gray)
                        
                        Text("2w")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color.gray)
                        
                    }
                    
                    Text(tweet.caption)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.black)
                    
                })
                
                Spacer()
            }.padding( [.bottom, .trailing])
            
            TweetActionView(tweet: tweet)
            
            Divider()
        }
    }
}


