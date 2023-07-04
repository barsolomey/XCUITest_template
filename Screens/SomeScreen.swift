//
//  SomeScreen.swift
//  Scheme name
//
//  Created by Artem Belov on 30.05.2023.
//

import XCTest

class SomeScreen: BaseScreen {
    // verifying some screen presence by checking existence of 1 unique element on the screen
    private let debugButton: XCUIElement

    init(app: XCUIApplication, file: StaticString = #filePath, line: UInt = #line) {
        debugButton = app.buttons["Debug"]

        super.init(app: app, expectedElement: debugButton, file: file, line: line)
    }
}
