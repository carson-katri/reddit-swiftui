//
//  PostView.swift
//  Reddit
//
//  Created by Carson Katri on 7/21/19.
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
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                    .cornerRadius(5.0)
            }
            VStack(alignment: .leading) {
                // Title
                HStack {
                    // Pinned icon
                    if post.stickied {
                        Image(systemName: "pin.fill")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .rotationEffect(Angle(degrees: 45))
                            .foregroundColor(Color("stickied"))
                    }
                    Text(post.title)
                        .font(.headline)
                }
                // Body preview
                Text(post.selftext != "" ? post.selftext : " ")
                    .font(.caption)
                    .opacity(0.75)
                // Metadata for the post
                HStack {
                    ForEach([("arrow.up", "\(post.score)"), ("text.bubble", "\(post.num_comments)"), ("clock", "\(timeSince(post.created))")], id: \.0) { item in
                        Group {
                            Image(systemName: item.0)
                                .resizable()
                                .frame(width: 10.0, height: 10.0)
                            Text(item.1)
                                .font(.caption)
                        }
                    }
                }
                .opacity(0.75)
            }
        }
    }
}
