//
//  TagView.swift
//  Reddit
//
//  Created by Carson Katri on 8/9/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct FlairView: View {
    let flairs: [String]
    
    func flair(_ name: String) -> some View {
        Text(name)
            .font(.caption)
            .foregroundColor(.primary)
            .padding(5)
            .background(Color.secondary.opacity(0.5))
            .cornerRadius(4)
    }
    
    var body: some View {
        HStack {
            ForEach(flairs, id: \.self) {
                self.flair($0)
            }
        }
    }
}

#if DEBUG
struct FlairView_Previews: PreviewProvider {
    static var previews: some View {
        FlairView(flairs: ["Hello", "World"])
    }
}
#endif
