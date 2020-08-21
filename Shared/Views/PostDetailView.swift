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
        let vstack = VStack(alignment: .leading) {
            Text(post.author)
                .font(.caption)
                .opacity(0.75)
            Text(post.title)
                .font(.title)
                .bold()
        }
        #if os(iOS)
        return vstack
        #elseif os(macOS)
        /// Fill window width
        return vstack.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
        #endif
    }
    
    var body: some View {
        let list = List {
            // Image
            if post.url.contains(".jpg") || post.url.contains(".png") {
                RequestImage(Url(post.url), contentMode: .fit)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
            }
            // GIF
            if post.url.contains(".gif") {
                WebView(url: URL(string: post.url)!)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
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
            VStack{
                ScrollView(.horizontal) {
                    HStack{
                        if post.flairs.count > 0 {
                            FlairView(flairs: post.flairs)
                        }
                        MetadataView(post: post, spaced: true)
                    }
                    .padding(.bottom, 10)
                }
            }
            CommentsView(post: post)
        }
        #if os(iOS)
        return list.navigationBarTitle(Text("r/\(post.subreddit)"), displayMode: .inline)
        #else
        return list
        #endif
    }
}

#if DEBUG
struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: Post.example)
    }
}
#endif
