//
//  ContentView.swift
//  Reddit
//
//  Created by Carson Katri on 7/20/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct ContentView : View {
    @State private var subreddit: String = "swift"
    @State private var sortBy: SortBy = .hot
    
    @State private var showSortSheet: Bool = false
    @State private var showSubredditSheet: Bool = false
    
    var body: some View {
        NavigationView {
            /// Load the posts
            PostList(subreddit: subreddit, sortBy: sortBy)
            /// Force inline `NavigationBar`
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(leading: HStack {
                Button(action: {
                    self.showSubredditSheet.toggle()
                }) {
                    Text("r/\(self.subreddit)")
                }
            }, trailing: HStack {
                Button(action: {
                    self.showSortSheet.toggle()
                }) {
                    HStack {
                        Image(systemName: "arrow.up.arrow.down")
                        Text(self.sortBy.rawValue)
                    }
                }
            })
            /// Sorting method `ActionSheet`
            .actionSheet(isPresented: $showSortSheet) {
                ActionSheet(title: Text("Sort By:"), buttons: [SortBy.hot, SortBy.top, SortBy.new, SortBy.controversial, SortBy.rising].map { method in
                    ActionSheet.Button.default(Text(method.rawValue.prefix(1).uppercased() + method.rawValue.dropFirst())) {
                        self.sortBy = method
                    }
                })
            }
            /// Subreddit selection `Popover`
            .popover(isPresented: $showSubredditSheet, attachmentAnchor: .point(UnitPoint(x: 20, y: 20))) {
                HStack(spacing: 0) {
                    Text("r/")
                    TextField("Subreddit", text: self.$subreddit) {
                        self.showSubredditSheet.toggle()
                    }
                }
                .frame(width: 200)
                .padding()
                .background(Color("popover"))
                .cornerRadius(10)
            }
            Text("Select a post")
        }
    }
}
