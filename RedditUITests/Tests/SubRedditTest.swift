//
//  SubRedditTest.swift
//  RedditUITests
//
//  Created by Tim Jonsson on 2022-01-20.
//  Copyright © 2022 Carson Katri. All rights reserved.
//

import Foundation

import XCTest

class SubRedditTest: BaseUITest {

    private var homeScreen: HomeScreen!
    private var changeSubThreadScreen: ChangeSubThreadScreen!
    private var filterScreen: FilterScreen!

    override func setUp() {
        super.setUp()
        homeScreen = HomeScreen(app: self.app)
        changeSubThreadScreen = ChangeSubThreadScreen(app: self.app)
        filterScreen = FilterScreen(app: self.app)
    }

    func testChangeSubRedditToJava() {
        homeScreen
            .tapOnSubThreadHeading()
        changeSubThreadScreen
            .changeSubThreadText(newSubRedditText: SubbReddits.java.rawValue)
            .swipeAwayScreen()
        homeScreen
            .SubRedditIsDisplaying(subReddit: SubbReddits.java.rawValue)
    }

    func testChangeSubRedditToCode() {
        homeScreen
            .tapOnSubThreadHeading()
        changeSubThreadScreen
            .changeSubThreadText(newSubRedditText: SubbReddits.code.rawValue)
            .swipeAwayScreen()
        homeScreen
            .SubRedditIsDisplaying(subReddit: SubbReddits.code.rawValue)
    }
}
