//
//  TextArea.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 12/06/21.
//

import SwiftUI

struct TextArea: View {
    
    @Binding private var text: String
    private var placeholder: String
    
    init(placeHolderText: String, bindingText: Binding<String>) {
        self._text = bindingText
        self.placeholder = placeHolderText
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .foregroundColor(.black)
            
        }.font(.body)
    }
}

struct TextArea_Previews: PreviewProvider {
    static var previews: some View {
        TextArea(placeHolderText: "What's Happening?", bindingText: .constant(""))
    }
}
