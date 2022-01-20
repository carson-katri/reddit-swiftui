//
//  StartingTest.swift
//  RedditUITests
//
//  Created by Tim Jonsson on 2022-01-19.
//  Copyright © 2022 Carson Katri. All rights reserved.
//

import XCTest

class SortingTest: BaseUITest {

    private var homeScreen: HomeScreen!
    private var changeSubThreadScreen: ChangeSubThreadScreen!
    private var filterScreen: FilterScreen!


    override func setUp() {
        super.setUp()
        homeScreen = HomeScreen(app: self.app)
        changeSubThreadScreen = ChangeSubThreadScreen(app: self.app)
        filterScreen = FilterScreen(app: self.app)
    }

    func testChangeSortingToTop() {
        homeScreen
            .tapOnSortButton()
        filterScreen
            .tapSortMethod(sortingMethod: SortingMethods.top.rawValue)
        homeScreen
            .SortingMethodIsDisplaying(sortingMethod: SortingMethods.top.rawValue)
    }

    func testChangeSortingToHot() {
        homeScreen
            .tapOnSortButton()
        filterScreen
            .tapSortMethod(sortingMethod: SortingMethods.hot.rawValue)
        homeScreen
            .SortingMethodIsDisplaying(sortingMethod: SortingMethods.hot.rawValue)
    }

    func testChangeSortingToNew() {
        homeScreen
            .tapOnSortButton()
        filterScreen
            .tapSortMethod(sortingMethod: SortingMethods.new.rawValue)
        homeScreen
            .SortingMethodIsDisplaying(sortingMethod: SortingMethods.new.rawValue)
    }

    func testChangeSortingToControversial() {
        homeScreen
            .tapOnSortButton()
        filterScreen
            .tapSortMethod(sortingMethod: SortingMethods.controversial.rawValue)
        homeScreen
            .SortingMethodIsDisplaying(sortingMethod: SortingMethods.controversial.rawValue)
    }

    func testChangeSortingToRising() {
        homeScreen
            .tapOnSortButton()
        filterScreen
            .tapSortMethod(sortingMethod: SortingMethods.rising.rawValue)
        homeScreen
            .SortingMethodIsDisplaying(sortingMethod: SortingMethods.rising.rawValue)
    }

    func testChangeSortingToRising1() {
        homeScreen
            .tapOnSortButton()
        filterScreen
            .tapSortMethod(sortingMethod: SortingMethods.rising.rawValue)
        homeScreen
            .SortingMethodIsDisplaying(sortingMethod: SortingMethods.rising.rawValue)
    }
}
