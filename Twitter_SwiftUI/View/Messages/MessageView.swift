//
//  MessageView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 03/06/21.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let eachMessage: Message
    var body: some View {
        HStack {
            
            if eachMessage.isFromCurrentUser {
                Spacer()
                Text(eachMessage.text)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            } else {
                HStack(alignment: .bottom) {
                    KFImage(URL(string: eachMessage.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(eachMessage.text)
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

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(eachMessage: MOCK_MESSAGES[0])
//    }
//}
