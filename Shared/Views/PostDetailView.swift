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
    @State private var comment: String = ""
    #if os(iOS)
    @EnvironmentObject private var keyboardObserver: KeyboardObserver
    #endif
    
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
        return vstack.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        #endif
    }
    
    var body: some View {
        let list = ZStack(alignment: Alignment.bottomLeading) {
            List {
                // Image
                if post.url.contains(".jpg") || post.url.contains(".png") {
                    RequestImage(Url(post.url), contentMode: .fit)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                }
                // GIF
                if post.url.contains(".gif") {
                    WebView(url: URL(string: post.url)!)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
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
                if post.flairs.count > 0 {
                    FlairView(flairs: post.flairs)
                }
                MetadataView(post: post, spaced: true)
                CommentsView(post: post)
            }
            .padding(.bottom, 40)
            /// Comment text field
            #if os(macOS)
            AddCommentView(text: $comment, parentName: self.post.name)
            #else
            AddCommentView(text: $comment, parentName: self.post.name)
            .offset(y: keyboardObserver.keyboardHeight > 0 ? -(keyboardObserver.keyboardHeight - 50) : 0)
            .animation(.spring())
            #endif
        }
        #if os(iOS)
        return list.navigationBarTitle(Text("r/\(post.subreddit)"), displayMode: .inline)
        #else
        // TODO: Implement `onCommand`
        return list/*.onCommand(#selector(AppDelegate.upvote(_:))) {
            print("Command received in View")
        }*/
        #endif
    }
}
