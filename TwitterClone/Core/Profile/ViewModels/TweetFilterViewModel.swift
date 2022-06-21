//
//  TweetFilterViewModel.swift
//  TwitterSwiftClonePractice
//
//  Created by Ricardo Gonzalez on 6/15/22.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
//
//  TweetFilterViewModel.swift
//  TwitterClone
//
//  Created by Ricardo Gonzalez on 6/20/22.
//

import Foundation
