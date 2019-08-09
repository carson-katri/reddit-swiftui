//
//  WebView.swift
//  Reddit
//
//  Created by Carson Katri on 7/28/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import WebKit

/// `WKWebView` replacement for `SwiftUI`
struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        return WKWebView(frame: .zero)
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        uiView.load(URLRequest(url: url))
        uiView.isOpaque = false
    }
}
