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
            VStack(alignment: .leading) {
                #if os(iOS)
                Text(post.title)
                    .font(.headline)
                    .lineLimit(1)
                #elseif os(macOS)
                Text(post.title)
                    .bold()
                #endif
                /// Body preview
                Group {
                    if post.url.contains("reddit") {
                        Text(post.selftext != "" ? post.selftext : " ")
                    } else {
                        Text(post.url)
                    }
                }
                    .font(.caption)
                    .opacity(0.75)
                    .lineLimit(1)
                /// Metadata for the post
                MetadataView(post: post, spaced: false)
                    .font(.caption)
                    .opacity(0.75)
            }
            if post.thumbnail != "self" {
                Spacer()
                RequestImage(Url(post.thumbnail))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                    .cornerRadius(5.0)
            }
        }
    }
}

#if DEBUG
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.example)
    }
}
#endif
