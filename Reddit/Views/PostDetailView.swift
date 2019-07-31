//
//  PostDetailView.swift
//  Reddit
//
//  Created by Carson Katri on 7/22/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct PostDetailView: View {
    let post: Post
    
    var title: some View {
        VStack(alignment: .leading) {
            Text(post.author)
                .font(.caption)
                .opacity(0.75)
            Text(post.title)
                .font(.title)
                .bold()
        }
    }
    
    var body: some View {
        List {
            // Image
            if post.url.contains(".jpg") || post.url.contains(".png") {
                RequestImage(Url(post.url), contentMode: .fit)
                    .frame(maxHeight: 200)
            }
            // GIF
            if post.url.contains(".gif") {
                WebView(url: URL(string: post.url)!)
                    .frame(maxHeight: 200)
            }
            // Title
            if post.selftext == "" {
                NavigationLink(destination: WebView(url: URL(string: post.url)!)) {
                    title
                }
            } else {
                title
            }
            // Body
            if post.selftext != "" {
                Text(post.selftext)
            }
            MetadataView(post: post, spaced: true)
            CommentsView(post: post)
        }
        .navigationBarTitle(Text("r/\(post.subreddit)"), displayMode: .inline)
    }
}
