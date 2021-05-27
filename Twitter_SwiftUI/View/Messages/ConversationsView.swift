//
//  ConversationsView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 28/05/21.
//

import SwiftUI

struct ConversationsView: View {
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing, content: {
            ScrollView {
                VStack {
                    ForEach(0..<9) { _ in
                        ConversationsCell()
//                        Divider()
                    }
                }
            }
            
            Button(action: {}, label: {
                Image(systemName: "envelope")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
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

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
