//
//  BaseTest.swift
//  Scheme name
//
//  Created by Artem Belov on 30.05.2023.
//

import XCTest

class BaseTest: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
}
