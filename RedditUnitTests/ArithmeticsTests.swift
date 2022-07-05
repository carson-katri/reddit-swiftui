//
//  ArithmeticsTests.swift
//  RedditUnitTests
//
//  Created by Tim Jonsson on 2022-07-05.
//  Copyright © 2022 Carson Katri. All rights reserved.
//

import XCTest
@testable import Reddit

class ArithmeticTest: XCTestCase {
    
    var sut: Arithmetic!

    override func setUpWithError() throws {
        sut = Arithmetic()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testPositiveAddition() {
        // Given
        let num1 = 5
        let num2 = 4
        
        // When
        let result = sut.add(num1: num1, num2: num2)
        
        // Then
        XCTAssertEqual(result, 9)
    }
    
    func testPositiveSubtraction() {
        // Given
        let num1 = 5
        let num2 = 4
        
        // When
        let result = sut.subtract(num1: num1, num2: num2)
        
        // Then
        XCTAssertEqual(result, 1)
    }
    
    func testPositiveMultiplication() {
        // Given
        let num1 = 5
        let num2 = 4
        
        // When
        let result = sut.multiply(num1: num1, num2: num2)
        
        // Then
        XCTAssertEqual(result, 20)
    }
    
    func testPositiveDivision() {
        // Given
        let num1 = 20
        let num2 = 4
        
        // When
        let result = sut.divide(num1: num1, num2: num2)
        
        // Then
        XCTAssertEqual(result, 5)
    }
}
