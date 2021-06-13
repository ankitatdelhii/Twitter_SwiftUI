//
//  LoginView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 13/06/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            
            VStack {
                
                Image("twitter-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 220, height: 100)
                    .padding(.top, 88)
                
                VStack {
                    CustomTextField(text: $email, placeHolder: Text("Email"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .padding()
                    
                    CustomTextField(text: $password, placeHolder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .padding()
                }
                                
                Spacer()
                
            }
        }.background(Color(#colorLiteral(red: 0.1119716689, green: 0.6307634115, blue: 0.9512073398, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
