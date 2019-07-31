//
//  WebView.swift
//  Reddit
//
//  Created by Carson Katri on 7/28/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
#if os(iOS)
import WebKit

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
#elseif os(watchOS)
struct WebView: View {
    let url: URL
    var body: some View {
        Text("")
    }
}
#endif
