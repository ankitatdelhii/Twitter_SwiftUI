//
//  SearchView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 26/05/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            HStack {
                VStack {
                    ForEach(Range(0...5)) { _ in
                        NavigationLink(
                            destination: UserProfileView(),
                            label: {
                                UserCell()
                            })
                        
                    }
                }.padding(.leading)
                
                Spacer()
            }
            
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
