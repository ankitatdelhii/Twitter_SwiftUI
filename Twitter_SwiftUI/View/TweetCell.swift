//
//  TweetCell.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 16/05/21.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .top) {
                Image("batman")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4.0, content: {
                    HStack(alignment: .center) {
                        Text("Bruce Wayne")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text("@batman •")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color.gray)
                        
                        Text("2w")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(Color.gray)
                        
                    }
                    
                    Text("Its not who I am underneath, but what can I do that defines me.")
                        .font(.system(size: 13, weight: .medium))
                    
                })
            }.padding( [.bottom, .trailing])
            
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
            
            Divider()
        }
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
