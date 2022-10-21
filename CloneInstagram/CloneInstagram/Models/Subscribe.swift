//
//  Subscribe.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 20.10.22.
//

import Foundation

// модель данных ячейки
struct Subscribe {
    let commentAuthorAvatarImageName: String
    let commentText: String
    let reactionImageName: String
    let isReaction: Bool
    let postImageName: String
    let passedTime: String
    let isSubscribe: Bool?
    
    init(_ commentAuthorAvatarImageName: String,
         _ commentText: String,
         _ reactionImageName: String,
         _ isReaction: Bool,
         _ postImageName: String,
         _ passedTime: String,
         _ isSubscribe: Bool?) {
        self.commentAuthorAvatarImageName = commentAuthorAvatarImageName
        self.commentText = commentText
        self.reactionImageName = reactionImageName
        self.isReaction = isReaction
        self.postImageName = postImageName
        self.passedTime = passedTime
        self.isSubscribe = isSubscribe
    }
}
