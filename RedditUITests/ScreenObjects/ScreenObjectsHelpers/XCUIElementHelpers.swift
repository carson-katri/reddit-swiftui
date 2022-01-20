//
//  XCUIElementHelpers.swift
//  RedditUITests
//
//  Created by Tim Jonsson on 2022-01-18.
//  Copyright © 2022 Carson Katri. All rights reserved.
//

import XCTest

extension XCUIElement {

    func tapElement(_ seconds: TimeInterval = 5) {
        XCTAssert(self.waitForExistence(timeout: seconds), "Element \(self) is not existing")
        self.tap()
    }

    func waitForExistence( _seconds: TimeInterval = 5) {
        XCTAssert(self.waitForExistence(timeout: _seconds), "Element \(self) is not existing")
    }

    func isDisplayingOnScreen( _seconds: TimeInterval = 5) {
        XCTAssert(self.waitForExistence(timeout: _seconds), "Element \(self) is not existing")
        XCTAssert(self.isHittable)
    }
}
