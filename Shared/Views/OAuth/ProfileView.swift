//
//  ProfileView.swift
//  Reddit
//
//  Created by Carson Katri on 8/13/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Request

struct ProfileView: View {
    var body: some View {
        NavigationView {
            if API.default.loggedIn {
                RequestView<AnyView, SpinnerView>(Me.self, API.default.me) { me in
                    var list: AnyView!
                    if me != nil {
                        list = AnyView(List {
                            Section(header: Text("Karma")) {
                                KarmaView(link: me!.link_karma, comment: me!.comment_karma)
                                    .frame(maxWidth: .infinity)
                            }
                            Section(header: Text("Overview")) {
                                ForEach([
                                    (name: "Posts", icon: "list.bullet.below.rectangle", destination: AnyView(UserPosts(username: me!.name))),
                                    (name: "Comments", icon: "text.bubble", destination: AnyView(UserComments(username: me!.name)))
                                ], id: \.name) { item in
                                    NavigationLink(destination: item.destination) {
                                        HStack {
                                            Image(systemName: item.icon)
                                            Text(item.name)
                                        }
                                    }
                                }
                            }
                            Section {
                                Button(action: {
                                    print("Logout")
                                    API.default.logout()
                                }) {
                                    Text("Logout")
                                }
                            }
                        })
                    } else {
                        list = AnyView(SpinnerView())
                    }
                    #if !os(macOS)
                    list = AnyView(list.navigationBarTitle(me != nil ? me!.name : ""))
                    #endif
                    return TupleView<(AnyView, SpinnerView)>((list, SpinnerView()))
                }
            } else {
                #if os(macOS)
                Button(action: {
                    NSWorkspace.shared.open(URL(string: API.default.oauthLoginURL())!)
                }) {
                    Text("Login")
                }
                #else
                SafariView(url: URL(string: API.default.oauthLoginURL())!)
                    .navigationBarTitle("Login")
                #endif
            }
            Text("Select a category")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
