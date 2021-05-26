//
//  SearchBar.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 26/05/21.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
            
            TextField("Search...", text: $text)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
        }.background(Color(.systemGray6))
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."))
    }
}
