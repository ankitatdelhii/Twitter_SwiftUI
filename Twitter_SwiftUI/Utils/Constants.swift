//
//  Constants.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 25/06/21.
//

import Foundation
import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users")
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")