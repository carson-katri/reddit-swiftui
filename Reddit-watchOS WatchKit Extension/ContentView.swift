//
//  ContentView.swift
//  Reddit-watchOS WatchKit Extension
//
//  Created by Carson Katri on 7/29/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct ContentView: View {
    @State private var subreddit: String = "swift"
    @State private var sortBy: SortBy = .hot
    
    @State private var showSettings: Bool = false
    
    var body: some View {
        /// Load the `Post`s
        RequestView(Listing.self, Request {
            Url(API.subredditURL(subreddit, sortBy))
            Query(["raw_json":"1"])
        }) { listing in
            /// List of `PostView`s when loaded
            List {
                /// Settings `Button`
                Button(action: {
                    self.showSettings.toggle()
                }) {
                    HStack {
                        Image(systemName: "gear")
                        Text("r/\(self.subreddit) | \(self.sortBy.rawValue)")
                    }
                }
                /// Post items
                ForEach(listing != nil ? listing!.data.children.map { $0.data } : [], id: \.id) { post in
                    NavigationLink(destination: PostDetailView(post: post)) {
                        PostView(post: post)
                    }
                }
            }
            /// Spinner when loading
            SpinnerView()
        }
        .navigationBarTitle("r/\(self.subreddit) | \(self.sortBy.rawValue)")
        .sheet(isPresented: $showSettings) {
            SettingsView(showSettings: self.$showSettings, subreddit: self.$subreddit, sortBy: self.$sortBy)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        List([0, 1, 2], id: \.self) { item in
            PostView(post: Post(title: "Hello World", name: "hello-world", id: "hw", selftext: "This is some body content. Blah blah\nblah blah blah", selftext_html: nil, thumbnail: "blahblah", url: "", author: "me", subreddit: "swift", score: 1000, num_comments: 50, stickied: true, created_utc: Date().timeIntervalSince1970, preview: nil, link_flair_text: "Hello World", is_original_content: true, spoiler: false, replies: nil))
        }
            .listStyle(CarouselListStyle())
    }
}
#endif
