//
//  API.swift
//  Reddit
//
//  Created by Carson Katri on 8/1/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Foundation

struct API {
    static func subredditURL(_ subreddit: String, _ sortBy: SortBy) -> String {
        return "https://www.reddit.com/r/\(subreddit)/\(sortBy.rawValue).json"
    }
    
    static func postURL(_ subreddit: String, _ id: String) -> String {
        return "https://www.reddit.com/r/\(subreddit)/\(id).json"
    }
}
