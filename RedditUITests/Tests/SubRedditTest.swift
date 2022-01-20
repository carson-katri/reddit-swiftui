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
        homeScreen
            .SortingMethodIsDisplaying(sortingMethod: SubbReddits.java.rawValue)
    }

    func testChangeSubRedditToPython() {
        homeScreen
            .tapOnSubThreadHeading()
        changeSubThreadScreen
            .changeSubThreadText(newSubRedditText: SubbReddits.python.rawValue)
        homeScreen
            .SortingMethodIsDisplaying(sortingMethod: SubbReddits.python.rawValue)
    }

    func testChangeSubRedditToSwift() {
        homeScreen
            .tapOnSubThreadHeading()
        changeSubThreadScreen
            .changeSubThreadText(newSubRedditText: SubbReddits.swift.rawValue)
        homeScreen
            .SortingMethodIsDisplaying(sortingMethod: SubbReddits.swift.rawValue)
    }
}
