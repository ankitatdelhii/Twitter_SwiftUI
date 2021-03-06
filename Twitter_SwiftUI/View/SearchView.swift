//
//  SearchView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 26/05/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            HStack {
                VStack {
                    ForEach(searchText.isEmpty ? viewModel.users : viewModel.filterUsers(searchText)) { user in
                        NavigationLink(
                            destination: LazyView(UserProfileView(user: user)),
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
