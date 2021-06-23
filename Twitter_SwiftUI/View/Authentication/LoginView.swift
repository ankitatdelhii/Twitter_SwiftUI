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
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("twitter-logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .padding(.top, 88)
                        .padding(.bottom, 32)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeHolder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                        
                        CustomSecureField(text: $password, placeHolder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                    }.padding(.horizontal, 32)
                    
                    HStack {
                        Spacer()
                        
                        Text("Forgrot Password?")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.trailing, 32)
                    }.padding(.top, 16)
                    
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 360, height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                            .padding()
                    })
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView().navigationBarBackButtonHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an account?")
                                    .font(.system(size: 14, weight: .regular))
                                
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding(.bottom, 40)
                        })
                    
                }
            }.background(Color(#colorLiteral(red: 0.1119716689, green: 0.6307634115, blue: 0.9512073398, alpha: 1)))
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
