//
//  ConversationsCell.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 28/05/21.
//

import SwiftUI
import Kingfisher

struct ConversationsCell: View {
    
    let message: Message
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .frame(width: 56, height: 56)
                    .clipped()
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(message.user.fullName)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(message.text)
                        .font(.system(size: 15, weight: .regular))
                        .lineLimit(2)
//                        .fixedSize(horizontal: false, vertical: true)
                }.padding(.trailing)
                .foregroundColor(.black)
//                .frame(height: 60)
                
                Spacer()
            }.padding()
            
            Divider()
        }
    }
}

//struct ConversationsCell_Preview: PreviewProvider {
//    static var previews: some View {
//        ConversationsCell()
//    }
//}
