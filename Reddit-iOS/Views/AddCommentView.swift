//
//  AddCommentView.swift
//  Reddit
//
//  Created by Carson Katri on 8/14/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct AddCommentView: View {
    @Binding var text: String
    let parentName: String
    
    var body: some View {
        HStack {
            TextField("Add Comment", text: $text)
                .cornerRadius(4)
            Image(systemName: "arrow.up.circle.fill")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(.blue)
            .onTapGesture {
                API.default.comment(self.text, on: self.parentName) {
                    self.text = ""
                }
            }
        }
        .padding(10)
        .background(Color("popover"))
        //.cornerRadius(5)
    }
}

#if DEBUG
struct AddCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommentView(text: .constant(""), parentName: "t3_helloworld")
            //.environment(\.colorScheme, .dark)
    }
}
#endif
