//
//  NewSearchView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 03/06/21.
//

import SwiftUI

struct NewSearchView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            HStack {
                VStack {
                    ForEach(Range(0...5)) { _ in
                        Button(action: {
                            self.show.toggle()
                            self.startChat.toggle()
                        }, label: {
                            UserCell()
                        })
                        
                    }
                }.padding(.leading)
                
                Spacer()
            }
            
        }
        
    }
}

struct NewSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NewSearchView(show: .constant(true), startChat: .constant(true))
    }
}
