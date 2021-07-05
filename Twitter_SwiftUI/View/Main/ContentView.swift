//
//  ContentView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 15/05/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    
                    TabView(selection: $selectedIndex) {
                        FeedView()
                            .onTapGesture {
                                self.selectedIndex = 0
                            }
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                            .tag(0)
                        
                        SearchView()
                            .onTapGesture {
                                self.selectedIndex = 1
                            }
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }.tag(1)
                        
                        ConversationsView()
                            .onTapGesture {
                                self.selectedIndex = 2
                            }
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }.tag(2)
                    }
                    
                    .navigationTitle(viewModel.tabTitle(forIndex: selectedIndex))
                    .navigationBarItems(leading: Button(action: {
                        viewModel.signOut()
                    }, label: {
                        KFImage(URL(string: viewModel.user?.profileImageUrl ?? ""))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
