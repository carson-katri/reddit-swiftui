//
//  HomeScreen.swift
//  RedditUITests
//
//  Created by Tim Jonsson on 2022-01-18.
//  Copyright © 2022 Carson Katri. All rights reserved.
//

import XCTest
import Reddit

class HomeScreen {

    var app: XCUIApplication

    private lazy var subRedditButton = app.buttons["subRedditButton"]
    private lazy var sortText = app.staticTexts["sortIconText"]

    init(app: XCUIApplication) {
        self.app = app
    }

    @discardableResult
    func subRedditHeadingIsDisplaying() -> Self {
        subRedditButton.isDisplayingOnScreen()
        return self
    }

    @discardableResult
    func tapOnSubThreadHeading() -> Self {
        subRedditButton.tap()
        return self
    }

    @discardableResult
    func tapOnSortButton() -> Self {
        sortText.tap()
        return self
    }

    @discardableResult
    func  SortingMethodIsDisplaying(sortingMethod: String) -> Self {
        sortText.isDisplayingOnScreen()
        XCTAssert(sortText.label == sortingMethod) 
        return self
    }

    @discardableResult
    func SubRedditIsDisplaying(subReddit: String) -> Self {
        subRedditButton.isDisplayingOnScreen()
        XCTAssert(subRedditButton.label == "r/" + subReddit)
        return self
    }
}
