//
//  UserProfileView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 04/06/21.
//

import SwiftUI

struct UserProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                    .padding(.top)
            }
        }.navigationTitle("Batman")
    }
}
