//
//  BaseTest.swift
//  RedditUITests
//
//  Created by Tim Jonsson on 2022-01-19.
//  Copyright © 2022 Carson Katri. All rights reserved.
//

import XCTest

class BaseUITest: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        app.launch()
        app.launchArguments.append("--uitesting")
        continueAfterFailure = false
    }
}
