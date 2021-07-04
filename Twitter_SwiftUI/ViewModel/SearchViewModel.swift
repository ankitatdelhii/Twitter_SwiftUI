//
//  SearchViewModel.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 25/06/21.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    private func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.map({ User(dictionary: $0.data()) })
        }
    }
    
    func filterUsers(_ query: String) -> [User] {
        return users.filter({ $0.username.lowercased().contains(query.lowercased())
            || $0.fullName.lowercased().contains(query.lowercased())
        })
    }
    
}
