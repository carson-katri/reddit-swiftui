//
//  MetadataView.swift
//  Reddit-watchOS WatchKit Extension
//
//  Created by Carson Katri on 7/29/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct MetadataView: View {
    let post: Post
    let spaced: Bool
    
    var stickied: some View {
        Group {
            /// Pinned icon
            if post.stickied {
                Image(systemName: "pin.fill")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(Color("stickied"))
            }
            if spaced {
                Spacer()
            }
        }
    }
    
    var body: some View {
        /// Spacers are placed to fill the width of the screen if desired
        HStack {
            if spaced {
                Spacer()
            }
            stickied
            /// Tuples store the SF Symbols, text, and color
            ForEach([("arrow.up", "\(post.score)", Color.orange), ("text.bubble", "\(post.num_comments)", Color.primary), ("clock", "\(timeSince(post.created_utc))", Color.primary)], id: \.0) { data in
                Group {
                    Image(systemName: data.0)
                    Text(data.1)
                    if self.spaced {
                        Spacer()
                    }
                }
                .foregroundColor(data.2)
            }
        }
    }
}

#if DEBUG
struct MetadataView_Previews: PreviewProvider {
    static var previews: some View {
        MetadataView(post: Post.example, spaced: true)
    }
}
#endif
