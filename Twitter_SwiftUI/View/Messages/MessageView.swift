//
//  MessageView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 03/06/21.
//

import SwiftUI

struct MessageView: View {
    let eachMessage: MockMessage
    var body: some View {
        HStack {
            
            if eachMessage.isCurrentUser {
                Spacer()
                Text(eachMessage.message)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            } else {
                HStack(alignment: .bottom) {
                    Image(eachMessage.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(eachMessage.message)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black)
                    
                }.padding(.horizontal)
                Spacer()
                
            }
            
            
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(eachMessage: MOCK_MESSAGES[0])
    }
}
