//
//  SpinnerView.swift
//  Reddit-macOS
//
//  Created by Carson Katri on 7/31/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct SpinnerView : NSViewRepresentable {
    func makeNSView(context: NSViewRepresentableContext<SpinnerView>) -> NSProgressIndicator {
        NSProgressIndicator()
    }
    
    func updateNSView(_ nsView: NSProgressIndicator, context: NSViewRepresentableContext<SpinnerView>) {
        nsView.isIndeterminate = true
        nsView.style = .spinning
        nsView.startAnimation(self)
    }
}
