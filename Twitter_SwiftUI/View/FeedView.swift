//
//  FeedView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 16/05/21.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            ScrollView {
                
            }
            
            Button(action: {}, label: {
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
            
        })
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
