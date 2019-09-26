//
//  KeyboardObserver.swift
//  Reddit
//
//  Created by Carson Katri on 8/14/19.
//  Copyright © 2019 Carson Katri. All rights reserved.
//

import SwiftUI
import Combine

/// Watch for changes in the keyboard to adjust content positioning to fit onscreen.
final class KeyboardObserver: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        keyboardHeight = 0
    }
}
