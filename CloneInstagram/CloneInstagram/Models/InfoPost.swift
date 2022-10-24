//
//  InfoPost.swift
//  CloneInstagram
//
//  Created by Oleg_Yakovlev on 22.10.22.
//

import Foundation

// Модель для подробной информации о посте
struct InfoPost {
    let imageName: String?
    let postName: String?
    
    init(_ name: String, _ text: String) {
        imageName = name
        postName = text
    }
}
