//
//  NewTweetView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 11/06/21.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @Binding var isNewTweetShowing: Bool
    @State private var tweetText: String = ""
    @ObservedObject var viewModel: UploadTweetViewModel
    
    init(isPresented: Binding<Bool>) {
        self._isNewTweetShowing = isPresented
        viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    if let hasProfileUrl = AuthViewModel.shared.user?.profileImageUrl {
                        KFImage(URL(string: hasProfileUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .clipShape(Circle())
                            .frame(width: 64, height: 64)
                    }
                    
                    TextArea(placeHolderText: "What's Happening?", bindingText: $tweetText)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }.padding()
                
                .navigationBarItems(leading:
                                        Button(action: { isNewTweetShowing.toggle() }, label: {
                                            Text("Cancel")
                                        })
                                    , trailing:
                                        Button(action: {
                                            viewModel.uploadTweet(caption: tweetText)
                                        }, label: {
                                            Text("Tweet")
                                                .padding(.horizontal)
                                                .padding(.vertical, 8)
                                                .background(Color.blue)
                                                .foregroundColor(Color.white)
                                                .clipShape(Capsule())
                                        })
            )
                
                Spacer()
            }
        }
    }
}

