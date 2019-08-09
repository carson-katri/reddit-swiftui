//
//  Post.swift
//  Reddit
//
//  Created by Carson Katri on 7/21/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Foundation

/// A post from the Reddit API
struct Post: Decodable, Identifiable {
    let title: String
    let name: String
    let id: String
    /// The body of the post
    let selftext: String
    let selftext_html: String?
    let thumbnail: String
    let url: String
    let author: String
    let subreddit: String
    let score: Int
    let num_comments: Int
    let stickied: Bool
    let created_utc: Double
    let preview: Preview?
    
    let link_flair_text: String?
    let is_original_content: Bool
    let spoiler: Bool
    
    var flairs: [String] {
        var res: [String] = []
        if link_flair_text != nil {
            res.append(link_flair_text!)
        }
        if is_original_content {
            res.append("OC")
        }
        if spoiler {
            res.append("Spoiler")
        }
        return res
    }
    
    let replies: [Self]?
    
    struct Preview: Decodable {
        let images: [PreviewImage]
        let enabled: Bool
        
        struct PreviewImage: Decodable {
            let source: ImageSource
            let resolutions: [ImageSource]
            let id: String
            
            struct ImageSource: Decodable {
                let url: String
                let width: Int
                let height: Int
            }
        }
    }
}
