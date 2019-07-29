//
//  SpinnerView.swift
//  Reddit
//
//  Created by Carson Katri on 7/21/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI

struct SpinnerView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<SpinnerView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<SpinnerView>) {
        uiView.startAnimating()
    }
}

#if DEBUG
struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
#endif
