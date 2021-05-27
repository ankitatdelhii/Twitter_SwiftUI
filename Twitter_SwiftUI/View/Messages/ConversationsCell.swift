//
//  ConversationsCell.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 28/05/21.
//

import SwiftUI

struct ConversationsCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("venom-10")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .clipped()
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Venom")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("This is a long conversation that you want to fix in here. I would like to tell you that its working now.")
                        .font(.system(size: 14, weight: .regular))
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(.trailing)
            }
            
            Divider()
        }
    }
}

struct ConversationsCell_Preview: PreviewProvider {
    static var previews: some View {
        ConversationsCell()
    }
}
