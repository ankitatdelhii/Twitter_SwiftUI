//
//  MessageInputView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 30/05/21.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var messageText: String
    let sendAction: () -> ()
    
    var body: some View {
        HStack {
            
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
//                .padding(.leading)
            
            Button(action: sendAction, label: {
                Text("Send")
            })
//            .padding(.trailing)
            
        }
    }
}

//struct MessageInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageInputView(messageText: .constant(""))
//    }
//}
