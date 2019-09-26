//
//  CommentsView.swift
//  Reddit
//
//  Created by Carson Katri on 7/27/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct CommentsView: View {
    let post: Post
    
    var noComments: some View {
        Text("😞 No comments...")
            .frame(height: nil)
    }
    
    var body: some View {
        // Load the comments
        RequestView([CommentListing].self, API.default.post(post.subreddit, post.id)) { listings in
            if listings != nil {
                // `dropFirst` because `first` is the actual post
                if listings!.dropFirst().map({ $0.data.children }).flatMap({ $0.map { $0.data } }).count > 0 {
                    ForEach(listings!.dropFirst().map({ $0.data.children }).flatMap { $0.map { $0.data } }, id: \.id) { comment in
                        CommentView(comment: comment, nestLevel: 0)
                    }
                } else {
                    self.noComments
                }
            } else {
                self.noComments
            }
            SpinnerView()
        }
    }
}

struct CommentView: View {
    @State var comment: Comment
    let nestLevel: Int
    
    var body: some View {
        return Group {
            HStack {
                /// Left border for nested comments
                if nestLevel > 0 {
                    RoundedRectangle(cornerRadius: 1.5)
                        .foregroundColor(Color(hue: 1.0 / Double(nestLevel), saturation: 1.0, brightness: 1.0))
                        .frame(width: 3)
                }
                /// Content
                VStack(alignment: .leading) {
                    HStack {
                        Text(comment.author)
                        VoteView(votable: $comment)
                    }
                    .font(.caption)
                    .opacity(0.75)
                    Text(comment.body ?? "")
                }
            }
            .padding(.leading, CGFloat(self.nestLevel * 10))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            /// Recursive comments
            if comment.replies != nil {
                ForEach(comment.replies!.data.children.map { $0.data }, id: \.id) { reply in
                    CommentView(comment: reply, nestLevel: self.nestLevel + 1)
                }
            }
        }
    }
}
