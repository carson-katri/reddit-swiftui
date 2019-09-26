//
//  UserComments.swift
//  Reddit
//
//  Created by Carson Katri on 8/13/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct UserComments: View {
    let username: String
    
    var body: some View {
        let commentsList = RequestView(CommentListing.self, Request {
            Url(API.default.userCommentsURL(for: username))
            Query(["raw_json":"1"])
        }) { (listing: CommentListing?) in
            List(listing != nil ? listing!.data.children.map { $0.data } : [], id: \.id) { comment in
                CommentView(comment: comment, nestLevel: 0)
            }
            .listStyle(DefaultListStyle())
            SpinnerView()
        }
        #if os(macOS)
        return commentsList
        #else
        return commentsList.navigationBarTitle(Text("Comments"), displayMode: .inline)
        #endif
    }
}
