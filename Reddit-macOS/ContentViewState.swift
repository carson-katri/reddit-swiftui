//
//  ContentViewState.swift
//  Reddit-macOS
//
//  Created by Carson Katri on 7/31/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Combine

/// An `ObservableObject` to store information selected in the `NSToolbar`
final class ContentViewState: ObservableObject {
    @Published var subreddit: String = "swift"
    @Published var sortBy: SortBy = .hot
}
