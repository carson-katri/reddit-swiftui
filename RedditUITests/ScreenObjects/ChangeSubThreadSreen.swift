//
//  ChangeSubThreadSreen.swift
//  RedditUITests
//
//  Created by Tim Jonsson on 2022-01-20.
//  Copyright © 2022 Carson Katri. All rights reserved.
//

import Foundation
import XCTest

class ChangeSubThreadScreen {

    var app: XCUIApplication

    private lazy var subThreadText = app.buttons["subRedditText"]

    init(app: XCUIApplication) {
        self.app = app
    }

    @discardableResult
    func changeSubThreadText(newSubRedditText: String) -> Self {
        subThreadText.tapElement()
        subThreadText.typeText(newSubRedditText)
        return self
    }
}
