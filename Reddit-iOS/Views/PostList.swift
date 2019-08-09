//
//  PostList.swift
//  Reddit-macOS
//
//  Created by Carson Katri on 7/31/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct PostList: View {
    let subreddit: String
    let sortBy: SortBy
    
    var body: some View {
        /// Load posts from web and decode as `Listing`
        RequestView(Listing.self, Request {
            Url(API.subredditURL(subreddit, sortBy))
            Query(["raw_json":"1"])
        }) { listing in
            /// List of `PostView`s when loaded
            List(listing != nil ? listing!.data.children.map { $0.data } : []) { post in
                NavigationLink(destination: PostDetailView(post: post)) {
                    PostView(post: post)
                }
            }
            /// Spinner when loading
            SpinnerView()
        }
    }
}
