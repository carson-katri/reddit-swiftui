//
//  SpinnerView.swift
//  Reddit
//
//  Created by Carson Katri on 7/28/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

/// A circular spinner for SwiftUI
struct SpinnerView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<SpinnerView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<SpinnerView>) {
        uiView.startAnimating()
    }
}
