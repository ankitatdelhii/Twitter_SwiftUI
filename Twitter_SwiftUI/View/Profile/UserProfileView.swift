//
//  UserProfileView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 04/06/21.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding(.top)
            }
        }.navigationTitle("Batman")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
