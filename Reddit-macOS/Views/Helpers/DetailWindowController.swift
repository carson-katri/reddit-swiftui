//
//  DetailWindowController.swift
//  Reddit-macOS
//
//  Created by Carson Katri on 7/31/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import Cocoa
import SwiftUI

/// A class to handle opening windows for posts when doubling clicking the entry
class DetailWindowController<RootView : View>: NSWindowController {
    convenience init(rootView: RootView, width: CGFloat? = 400, height: CGFloat? = 500) {
        let hostingController = NSHostingController(rootView: rootView.frame(width: width, height: height))
        let window = NSWindow(contentViewController: hostingController)
        if let width = width, let height = height {
            window.setContentSize(NSSize(width: width, height: height))
        } else {
            window.contentMinSize = NSSize(width: 400, height: 500)
        }
        self.init(window: window)
    }
}
