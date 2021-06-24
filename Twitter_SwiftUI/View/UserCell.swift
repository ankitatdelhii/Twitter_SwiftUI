//
//  UserCell.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 27/05/21.
//

import Foundation
import SwiftUI
import Kingfisher

struct UserCell: View {
        
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .frame(width: 56, height: 56)
                .clipped()
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullName)
                    .font(.system(size: 14, weight: .regular))
            }.foregroundColor(.black)
        }
    }
}
