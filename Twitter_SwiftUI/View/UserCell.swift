//
//  UserCell.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 27/05/21.
//

import Foundation
import SwiftUI

struct UserCell: View {
        
    var body: some View {
        HStack(spacing: 12) {
            Image("venom-10")
                .resizable()
                .frame(width: 56, height: 56)
                .clipped()
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Venom")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Eddie Brock")
                    .font(.system(size: 14, weight: .regular))
            }
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
