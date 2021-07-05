//
//  SearchViewModel.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 25/06/21.
//

import SwiftUI
import Firebase

enum SearchViewModelConfig {
    case search
    case newmessage
}

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private let config: SearchViewModelConfig
    
    
    init(config: SearchViewModelConfig) {
        self.config = config
        fetchUsers()
    }
    
    private func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            switch self.config {
            
            case .search:
                self.users = documents.map({ User(dictionary: $0.data()) })
            case .newmessage:
                self.users = documents.map({ User(dictionary: $0.data()) }).filter({ !$0.isCurrentUser })
            }
            
        }
    }
    
    func filterUsers(_ query: String) -> [User] {
        return users.filter({ $0.username.lowercased().contains(query.lowercased())
            || $0.fullName.lowercased().contains(query.lowercased())
        })
    }
    
}
