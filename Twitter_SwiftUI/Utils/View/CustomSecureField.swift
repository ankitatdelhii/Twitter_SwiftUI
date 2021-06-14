//
//  CustomSecureField.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 13/06/21.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    var placeHolder: Text
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeHolder
                    .foregroundColor(Color(white: 1, opacity: 0.87))
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(text: .constant(""), placeHolder: Text("Email"))
    }
}
