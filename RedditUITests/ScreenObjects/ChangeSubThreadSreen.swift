//
//  ChangeSubThreadScreen.swift
//  RedditUITests
//
//  Created by Tim Jonsson on 2022-01-20.
//  Copyright © 2022 Carson Katri. All rights reserved.
//

import Foundation
import XCTest

class ChangeSubThreadScreen {

    var app: XCUIApplication

    private lazy var subThreadText = app.textFields["subRedditText"]
    private lazy var subThreadText1 = app.textFields["subRedditButton"]
    private lazy var popOverTable = app.tables.element(boundBy: 0)



    init(app: XCUIApplication) {
        self.app = app
    }

    @discardableResult
    func changeSubThreadText(newSubRedditText: String) -> Self {
        subThreadText.clearAndEnterText(text: newSubRedditText)
        return self
    }
    
    @discardableResult
    func swipeAwayScreen() -> Self {
        popOverTable.swipeDown(velocity: XCUIGestureVelocity.fast)
        return self
    }
}
