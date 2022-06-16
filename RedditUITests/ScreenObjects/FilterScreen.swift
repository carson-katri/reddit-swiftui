//
//  FilterScreen.swift
//  RedditUITests
//
//  Created by Tim Jonsson on 2022-01-19.
//  Copyright © 2022 Carson Katri. All rights reserved.
//

import Foundation
import XCTest

class FilterScreen {

    var app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    @discardableResult
    func chooseSortMethod(sortingMethod: String) -> Self {
//        let fistButton = app.buttons.matching(identifier: "\(sortingMethod)").element(boundBy: 1)
        app.buttons["\(sortingMethod)"].firstMatch.tapElement()
        return self
    }
}
