//
//  ChatView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 30/05/21.
//

import SwiftUI

struct ChatView: View {
    
    @State var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { eachMessage in
                        MessageView(eachMessage: eachMessage)
                    }
                }
            }.padding(.top)
            
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


