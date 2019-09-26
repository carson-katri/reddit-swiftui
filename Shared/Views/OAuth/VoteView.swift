//
//  VoteView.swift
//  Reddit
//
//  Created by Carson Katri on 8/15/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct VoteView<VotableThing: Thing> : View {
    @Binding var votable: VotableThing
    
    var body: some View {
        Group {
            Image(systemName: "arrow.up")
            .onTapGesture {
                if API.default.loggedIn {
                    if self.votable.likes == true {
                        API.default.unvote(self.votable.name) {
                            self.votable.likes = nil
                        }
                    } else {
                        API.default.upvote(self.votable.name) {
                            self.votable.likes = true
                        }
                    }
                }
            }
            .foregroundColor(votable.likes == true ? Color.orange : Color.primary)
            Text("\(votable.score + (votable.likes == nil ? 0 : (votable.likes == true ? 1 : -1)))")
            Image(systemName: "arrow.down")
            .onTapGesture {
                if API.default.loggedIn {
                    if self.votable.likes == false {
                        API.default.unvote(self.votable.name) {
                            self.votable.likes = nil
                        }
                    } else {
                        API.default.downvote(self.votable.name) {
                            self.votable.likes = false
                        }
                    }
                }
            }
            .foregroundColor(votable.likes == false ? Color.blue : Color.primary)
        }
    }
}
