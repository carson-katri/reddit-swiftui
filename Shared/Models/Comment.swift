//
//  Comment.swift
//  Reddit
//
//  Created by Carson Katri on 7/27/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

/// A comment from the Reddit API
struct Comment: Thing, Decodable {
    let id: String
    let name: String
    let author: String
    let score: Int
    var likes: Bool?
    let body: String?
    let parent_id: String?
    let stickied: Bool
    let replies: CommentListing?
    
    enum CommentKeys: String, CodingKey {
        case id
        case name
        case author
        case score
        case likes
        case body
        case replies
        case parent_id
        case stickied
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CommentKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        author = try values.decode(String.self, forKey: .author)
        score = try values.decode(Int.self, forKey: .score)
        likes = try? values.decode(Bool.self, forKey: .likes)
        body = try? values.decode(String.self, forKey: .body)
        stickied = try values.decode(Bool.self, forKey: .stickied)
        parent_id = try? values.decode(String.self, forKey: .parent_id)
        
        if let replies = try? values.decode(CommentListing.self, forKey: .replies) {
            self.replies = replies
        } else {
            replies = nil
        }
    }
}
