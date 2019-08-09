//
//  SortBy.swift
//  Reddit
//
//  Created by Carson Katri on 7/21/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Foundation

/// Sorting method for Reddit API
enum SortBy: String, CaseIterable {
    case hot
    case new
    case controversial
    case top
    case rising
}
