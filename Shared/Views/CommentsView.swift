//
//  CommentsView.swift
//  Reddit
//
//  Created by Carson Katri on 7/27/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

// MARK: - CommentsView

struct CommentsView: View {
    let post: Post
    
    var noComments: some View {
        Text("😞 No comments...")
            .frame(height: nil)
    }
    
    var body: some View {
        // Load the comments
        RequestView([CommentListing].self, Request {
            Url(API.postURL(post.subreddit, post.id))
            Header.Accept(.json)
        }) { listings in
            if listings != nil {
                // `dropFirst` because `first` is the actual post
                if listings!.dropFirst().map({ $0.data.children }).flatMap({ $0.map { $0.data } }).count > 0 {
                    ForEach(listings!.dropFirst().map({ $0.data.children }).flatMap { $0.map { $0.data } }, id: \.id) { comment in
                        CommentView(comment: comment, postAuthor: self.post.author, nestLevel: 0)
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

// MARK: - CommentView

struct CommentView: View {
    let comment: Comment
    let postAuthor: String
    let nestLevel: Int

    var authorText: some View {
        if comment.author == postAuthor {
            return Text(comment.author).foregroundColor(.accentColor).bold()
        } else {
            return Text(comment.author)
        }
    }
    
    var body: some View {
        Group {
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
                        authorText
                        Image(systemName: "arrow.up")
                        Text("\(comment.score)")
                    }
                        .font(.caption)
                        .opacity(0.75)
                    Text(comment.body ?? "")
                }
            }
            .padding(.leading, CGFloat(self.nestLevel * 10))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
            /// Recursive comments
            if comment.replies != nil {
                ForEach(comment.replies!.data.children.map { $0.data }, id: \.id) { reply in
                    CommentView(comment: reply, postAuthor: self.postAuthor, nestLevel: self.nestLevel + 1)
                }
            }
        }
    }
}

// MARK: - Comment View preview

#if DEBUG
struct CommentView_Previews: PreviewProvider {
    static func example(for author: String, nested: Int = 5) -> some View {
        CommentView(comment: Comment(nested: nested), postAuthor: author, nestLevel: 0).frame(width: nil, height: 60)
    }

    static var previews: some View {
        VStack {
            example(for: "not", nested: 2)
            example(for: "sirarkimedes")
        }
    }
}
#endif
