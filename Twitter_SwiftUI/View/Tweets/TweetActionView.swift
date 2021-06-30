//
//  TweetActionView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 01/07/21.
//

import SwiftUI

struct TweetActionView: View {
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
            
            Button(action: {}, label: {
                Image(systemName: "heart")
                    .frame(width: 32, height: 32)
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

