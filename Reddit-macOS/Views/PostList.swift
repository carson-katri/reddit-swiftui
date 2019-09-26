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
    
    //@Binding var currentPost: Post?
    
    var body: some View {
        List {
            Section(header: Text("\(subreddit) | \(sortBy.rawValue)")) {
                /// Load posts from web and decode as `Listing`
                RequestView(Listing.self, API.default.posts(subreddit, sortBy)) { listing in
                    /// List of `PostView`s when loaded
                    ForEach(listing != nil ? listing!.data.children.map { $0.data } : []) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            PostView(post: post)
                                .tag(post.id)
                            /*.onTapGesture {
                                self.currentPost = post
                            }*/
                            /// Double-click to open a new window for the `PostDetailView`
                            .onTapGesture(count: 2) {
                                let controller = DetailWindowController(rootView: PostDetailView(post: post))
                                controller.window?.title = post.title
                                controller.showWindow(nil)
                            }
                        }
                    }
                    /// Spinner when loading
                    SpinnerView()
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}
