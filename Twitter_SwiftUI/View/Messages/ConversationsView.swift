//
//  ConversationsView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 28/05/21.
//

import SwiftUI

struct ConversationsView: View {
    
    @State var isShowingNewMessageView = false
    @State var showChat = false
    @State var user: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing, content: {
            
            if let user = user {
                NavigationLink(
                    destination: LazyView(ChatView(user: user)),
                    isActive: $showChat,
                    label: {
                    })
            }

            
            ScrollView {
                VStack {
                    ForEach(viewModel.recentMessages) { eachRecentMessage in
                        NavigationLink(
                            destination: LazyView(ChatView(user: eachRecentMessage.user)),
                            label: {
                                ConversationsCell(message: eachRecentMessage)
                            })
                    }
                }
            }
            
            Button(action: { self.isShowingNewMessageView.toggle() }, label: {
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
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewSearchView(show: $isShowingNewMessageView, startChat: $showChat, user: $user)
            })
            
        })
        
    }
    
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
