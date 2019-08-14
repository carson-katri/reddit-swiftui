//
//  UserList.swift
//  Reddit
//
//  Created by Carson Katri on 8/13/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct UserPosts: View {
    let username: String
    
    var body: some View {
        let postsList = RequestView(Listing.self, Request {
            Url(API.default.userPostsURL(for: username))
            Query(["raw_json":"1"])
        }) { (listing: Listing?) in
            List(listing != nil ? listing!.data.children.map { $0.data } : []) { post in
                NavigationLink(destination: PostDetailView(post: post)) {
                    PostView(post: post)
                }
            }
            .listStyle(DefaultListStyle())
            SpinnerView()
        }
        #if os(macOS)
        return postsList
        #else
        return postsList.navigationBarTitle(Text("Posts"), displayMode: .inline)
        #endif
    }
}
