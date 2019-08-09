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
    
    @State private var selectedPost: String? = nil
    
    @EnvironmentObject private var state: ContentViewState
    
    var body: some View {
        NavigationView {
            /// Load the posts
            PostList(subreddit: state.subreddit, sortBy: state.sortBy)
                .frame(minWidth: 300)
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
