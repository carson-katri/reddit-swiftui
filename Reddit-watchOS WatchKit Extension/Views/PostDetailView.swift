//
//  PostDetailView.swift
//  Reddit-watchOS WatchKit Extension
//
//  Created by Carson Katri on 7/29/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        List {
            if post.url.contains(".jpg") || post.url.contains(".png") {
                RequestImage(Url(post.url))
            }
            
            Text(post.title)
                .font(.system(size: 21))
                .bold()
            Text(post.selftext)
            
            MetadataView(post: post, spaced: true)
                .font(.system(size: 10))
                .foregroundColor(.white)
                .lineLimit(1)
            
            CommentsView(post: post)
        }
        .navigationBarTitle("r/\(post.subreddit)")
    }
}

#if DEBUG
struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: Post(title: "Hello World | This is secondary text", name: "hello-world", id: "hw", selftext: "This is some body content. Blah blah\nblah blah blah", selftext_html: nil, thumbnail: "blahblah", url: "", author: "me", subreddit: "swift", score: 1000, num_comments: 50, stickied: true, created_utc: Date().timeIntervalSince1970, preview: nil, link_flair_text: "Hello World", is_original_content: true, spoiler: false, replies: nil))
    }
}
#endif
