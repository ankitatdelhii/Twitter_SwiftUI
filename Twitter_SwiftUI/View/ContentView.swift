//
//  ContentView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 15/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            TabView {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
                ConversationsView()
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
            }
            
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
