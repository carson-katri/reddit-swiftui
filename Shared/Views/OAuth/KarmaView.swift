//
//  KarmaView.swift
//  Reddit
//
//  Created by Carson Katri on 8/13/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct KarmaView: View {
    let link: Int
    let comment: Int
    
    var body: some View {
        HStack {
            ForEach([("Post", link), ("Comment", comment)], id: \.0) { karma in
                VStack {
                    Text("\(karma.1)")
                        .font(.largeTitle)
                        .bold()
                    Text("\(karma.0) Karma")
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

#if DEBUG
struct KarmaView_Previews: PreviewProvider {
    static var previews: some View {
        return KarmaView(link: 2520, comment: 10)
    }
}
#endif
