//
//  Listing.swift
//  Reddit
//
//  Created by Carson Katri on 7/21/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Foundation

struct Listing: Decodable {
    let data: ListingData
    
    struct ListingData: Decodable {
        let children: [PostData]
        
        struct PostData: Decodable {
            let data: Post
        }
    }
}

struct CommentListing: Decodable {
    let data: CommentListingData
    
    struct CommentListingData: Decodable {
        let children: [CommentData]
        
        struct CommentData: Decodable {
            let data: Comment
        }
    }
}
