//
//  ProfileActionButtonView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 04/06/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
    
    @ObservedObject var  viewModel: ProfileViewModel
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(action: {
                
            }, label: {
                Text("Edit Profile")
            })
            .frame(width: 360, height: 40)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
        } else {
            HStack {
                Button(action: {
                    viewModel.user.isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(viewModel.user.isFollowed ? "Following" : "Follow")
                })
                .frame(width: 180, height: 40)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(20)
                
                NavigationLink(destination: LazyView(ChatView(user: viewModel.user))) {
                    Text("Message")
                        .frame(width: 180, height: 40)
                        .background(Color.purple)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                
                
            }
        }
    }
}


