//
//  ProfileHeaderView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 04/06/21.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    @State private var selectedFilter: TweetFilterOptions = .tweets
    @Binding var isFollowed: Bool
    var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            
            KFImage(URL(string: viewModel.user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .shadow(color: .black, radius: 4, x: 0.0, y: 0.0)
            
            Text(viewModel.user.fullName)
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Billionaire by day, dark knight by night")
                .font(.system(size: 14, weight: .regular))
                .padding(.top, 8.0)
            
            HStack(spacing: 40.0) {
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding()
            
            ProfileActionButtonView(viewModel: viewModel, isFollowed: $isFollowed)
                .padding()
            
            
            Spacer()
            
        }
    }
}
