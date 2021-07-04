//
//  UserProfileView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 04/06/21.
//

import SwiftUI

struct UserProfileView: View {
    
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedFilter: TweetFilterOptions = .tweets
    
    init(user: User) {
        self.user = user
        viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel)
                    .padding(.top)
                
                FilterButtomView(selectedOption: $selectedFilter)
                
                ForEach(viewModel.tweets(forFilter: selectedFilter)) { eachTweet in
                    TweetCell(tweet: eachTweet)
                        .padding()
                }
            }
        }.navigationTitle(user.username)
    }
}
