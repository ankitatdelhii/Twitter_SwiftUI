//
//  SearchView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 26/05/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            HStack {
                VStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(
                            destination: UserProfileView(user: user),
                            label: {
                                UserCell(user: user)
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
