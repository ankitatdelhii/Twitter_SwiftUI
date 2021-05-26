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
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.top)
            
            VStack {
                ForEach(Range(0...12)) { _ in
                    Text("New User")
                }
            }.padding(.top)
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
