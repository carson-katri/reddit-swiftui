//
//  Listing.swift
//  Reddit
//
//  Created by Carson Katri on 7/21/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Foundation

/// Root of Reddit API response
struct Listing: Decodable {
    let data: ListingData
    var posts: [Post] {
        return data.children.map { (postData) -> Post in
            postData.data
        }
    }
    
    struct ListingData: Decodable {
        let children: [PostData]
        
        struct PostData: Decodable {
            let data: Post
        }
    }
}

/// Root of Reddit API response for comments
struct CommentListing: Decodable {
    let data: CommentListingData
    
    struct CommentListingData: Decodable {
        let children: [CommentData]
        
        struct CommentData: Decodable {
            let data: Comment
        }
    }
}
