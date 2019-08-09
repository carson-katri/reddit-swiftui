//
//  WebView.swift
//  Reddit-macOS
//
//  Created by Carson Katri on 7/31/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView : NSViewRepresentable {
    let url: URL
    
    func makeNSView(context: NSViewRepresentableContext<WebView>) -> WKWebView {
        WKWebView()
    }
    
    func updateNSView(_ nsView: WKWebView, context: NSViewRepresentableContext<WebView>) {
        nsView.load(URLRequest(url: url))
    }
}
