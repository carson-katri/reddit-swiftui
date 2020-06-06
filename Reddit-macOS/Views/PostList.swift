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
    let listing: Listing?
    let subreddit: String
    let sortBy: SortBy
    
    @State private var selection: String? = nil
    @State private var selectedPostIds: Set<String> = Set()
    
    var body: some View {
        List(selection: $selectedPostIds) {
            Section(header: Text("\(subreddit) | \(sortBy.rawValue)")) {
                /// List of `PostView`s when loaded
                ForEach(listing != nil ? listing!.data.children.map { $0.data } : []) { post in
                    VStack {
                        NavigationLink(destination: PostDetailView(post: post), tag: post.id, selection: self.$selection) { EmptyView() }
                        PostView(post: post)
                            .tag(post.id)
                            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                            .contentShape(Rectangle())
                            /// Double-click to open a new window for the `PostDetailView`
                            .onTapGesture(count: 2) {
                                let detailView = PostDetailView(post: post)
                                
                                let controller = DetailWindowController(rootView: detailView)
                                controller.window?.title = post.title
                                controller.showWindow(nil)
                        }
                            /// Adding after the double tap so that double tap takes precedence
                        .onTapGesture(count: 1) {
                            self.selection = post.id
                            self.selectedPostIds = Set(arrayLiteral: post.id)
                        }
                    }
                    .tag(post.id)
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}
