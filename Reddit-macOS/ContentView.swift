//
//  ContentView.swift
//  Reddit-macOS
//
//  Created by Carson Katri on 7/20/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct ContentView : View {
    @State private var sortBy: SortBy = .hot
    
    @State private var showSortSheet: Bool = false
    @State private var showSubredditSheet: Bool = false
    
    @State private var selectedPostId: String? = nil
    
    @EnvironmentObject private var state: ContentViewState
    
    var body: some View {
        NavigationView {
            /// Load the posts
            RequestView(Listing.self, Request {
                Url(API.subredditURL(state.subreddit, sortBy))
                Query(["raw_json":"1"])
            }) { listing in
                if listing != nil {
                    PostList(posts: listing!.posts, subreddit: self.state.subreddit, sortBy: self.state.sortBy, selectedPostId: self.$selectedPostId)
                    .frame(minWidth: 300)
                }
                else {
                    Text("Error while loading posts").frame(minWidth: 300, minHeight: 300)
                }
                /// Spinner when loading
                SpinnerView()
                    .frame(minWidth: 300, minHeight: 300)
            }
            Text("Select a post")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .touchBar {
            /*Picker("Sort By", selection: $state.sortBy) {
                ForEach(SortBy.allCases, id: \.rawValue) { sort in
                    Text(sort.rawValue)
                }
            }*/
            Text("Hello, World!")
        }
    }
}
