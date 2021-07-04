//
//  LazyView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 04/07/21.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
