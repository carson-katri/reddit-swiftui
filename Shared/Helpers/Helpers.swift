//
//  Helpers.swift
//  Reddit
//
//  Created by Carson Katri on 7/27/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Foundation
import SwiftUI

/// `RelativeDateTimeFormatter` convenience function
func timeSince(_ interval: TimeInterval) -> String {
    let formatter = RelativeDateTimeFormatter()
    return formatter.localizedString(for: Date(timeIntervalSince1970: interval), relativeTo: Date())
}

/// `SwiftUI` compatibility
#if os(macOS)
extension Image {
    init(systemName: String) {
        self.init(nsImage: NSImage())
    }
}
#endif
