//
//  PostView.swift
//  Reddit-watchOS WatchKit Extension
//
//  Created by Carson Katri on 7/29/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct PostView: View {
    let post: Post
    var body: some View {
        HStack {
            if post.thumbnail != "self" {
                RequestImage(Url(post.thumbnail))
                    .frame(width: 32, height: 32)
                    .cornerRadius(5)
            }
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 2) {
                    if post.stickied {
                        Image(systemName: "pin.fill")
                            .resizable()
                            .foregroundColor(.green)
                            .frame(width: 10, height: 10)
                            .rotationEffect(Angle(degrees: 45))
                    }
                    Text(post.title)
                        .lineLimit(1)
                }
                Text(post.selftext)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
        .padding([.top, .bottom])
    }
}

#if DEBUG
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(title: "Hello World | This is secondary text", name: "hello-world", id: "hw", selftext: "This is some body content. Blah blah\nblah blah blah", selftext_html: nil, thumbnail: "blahblah", url: "", author: "me", subreddit: "swift", score: 1000, num_comments: 50, stickied: true, created_utc: Date().timeIntervalSince1970, preview: nil, link_flair_text: "Hello World", is_original_content: true, spoiler: false, replies: nil))
    }
}
#endif
