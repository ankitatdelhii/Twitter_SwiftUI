//
//  FilterButtomView.swift
//  Twitter_SwiftUI
//
//  Created by Ankit Saxena on 04/06/21.
//

import SwiftUI

enum TweetFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        
        case .tweets:
            return "Tweets"
        case .replies:
            return "Tweets & Replies"
        case .likes:
            return "Likes"
        }
    }
}


struct FilterButtomView: View {
    
    @Binding var selectedOption: TweetFilterOptions
    
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
    
    private var padding: CGFloat {
        let padding = underlineWidth * CGFloat(selectedOption.rawValue)
        return padding + 16
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(spacing: 0) {
                
                ForEach(TweetFilterOptions.allCases, id: \.self) { eachOption in
                    
                    Button(action: {
                        self.selectedOption = eachOption
                    }, label: {
                        Text(eachOption.title)
                    })
                    .frame(width: underlineWidth)
                }
            }
            
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3)
                .foregroundColor(Color.blue)
                .padding(.leading, padding)
                .animation(.spring())
        }
    }
}

struct FilterButtomView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtomView(selectedOption: .constant(.likes))
    }
}
