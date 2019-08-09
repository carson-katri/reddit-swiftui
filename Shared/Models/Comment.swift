//
//  Comment.swift
//  Reddit
//
//  Created by Carson Katri on 7/27/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Foundation

/// A comment from the Reddit API
struct Comment: Decodable {
    let id: String
    let author: String
    let score: Int
    let body: String?
    let replies: CommentListing?
    
    enum CommentKeys: String, CodingKey {
        case id
        case author
        case score
        case body
        case replies
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CommentKeys.self)
        id = try values.decode(String.self, forKey: .id)
        author = try values.decode(String.self, forKey: .author)
        score = try values.decode(Int.self, forKey: .score)
        body = try? values.decode(String.self, forKey: .body)
        
        if let replies = try? values.decode(CommentListing.self, forKey: .replies) {
            self.replies = replies
        } else {
            replies = nil
        }
    }
}
