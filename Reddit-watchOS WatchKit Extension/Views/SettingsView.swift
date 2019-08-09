//
//  SettingsView.swift
//  Reddit-watchOS WatchKit Extension
//
//  Created by Carson Katri on 8/8/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showSettings: Bool
    @Binding var subreddit: String
    @Binding var sortBy: SortBy
    
    var body: some View {
        ScrollView {
            HStack {
                Text("r/")
                TextField("Subreddit", text: self.$subreddit)
            }
            Picker(selection: $sortBy, label: Text("Sort By")) {
                ForEach(SortBy.allCases, id: \.rawValue) { sort in
                    Text(sort.rawValue).tag(sort)
                }
            }
            .frame(height: 100)
            Button(action: {
                self.showSettings.toggle()
            }) { Text("Done") }
            .background(Color.white.opacity(0.25))
            .cornerRadius(4)
        }
    }
}

#if DEBUG
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSettings: .constant(true), subreddit: .constant("swift"), sortBy: .constant(.hot))
    }
}
#endif
