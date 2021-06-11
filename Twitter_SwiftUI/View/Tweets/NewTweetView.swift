//
//  NewTweetView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 11/06/21.
//

import SwiftUI

struct NewTweetView: View {
    
    @Binding var isNewTweetShowing: Bool
    @State private var tweetText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .top) {
                    Image("batman")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                    
                    TextArea(placeHolderText: "What's Happening?", bindingText: $tweetText)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }.padding()
                
                .navigationBarItems(leading:
                                        Button(action: { isNewTweetShowing.toggle() }, label: {
                                            Text("Cancel")
                                        })
                                    , trailing:
                                        Button(action: { isNewTweetShowing.toggle() }, label: {
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

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isNewTweetShowing: .constant(true))
    }
}
