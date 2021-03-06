//
//  Message.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 30/05/21.
//

import Foundation
import Firebase

struct Message: Identifiable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    
    var chatPartnerID: String { return isFromCurrentUser ? toId : fromId}
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
}










struct MockMessage: Identifiable {
    let id: Int
    let image: String
    let message: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
        .init(id: 0, image: "spiderman", message: "Hi", isCurrentUser: true),
        .init(id: 1, image: "batman", message: "Hi", isCurrentUser: false),
        .init(id: 2, image: "spiderman", message: "How are you?", isCurrentUser: true),
        .init(id: 3, image: "batman", message: "I am fine bro!", isCurrentUser: false),
        .init(id: 4, image: "spiderman", message: "How are you? Is your health fine now?", isCurrentUser: true),
        .init(id: 5, image: "batman", message: "Yes I am doing good. How is your Job going?", isCurrentUser: false),
        .init(id: 6, image: "spiderman", message: "Its going decent. But I need to do something else now. I am not too much into job. I will start my business soon.", isCurrentUser: true),
        .init(id: 7, image: "batman", message: "That's great news bro. All the best.", isCurrentUser: false),
        .init(id: 8, image: "spiderman", message: "Thanks", isCurrentUser: true)
]
