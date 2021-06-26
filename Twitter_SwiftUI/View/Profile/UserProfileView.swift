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
    
    init(user: User) {
        self.user = user
        viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
                    .padding(.top)
            }
        }.navigationTitle("Batman")
    }
}
