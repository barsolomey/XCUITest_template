//
//  XCUIElement+Extensions.swift
//  Scheme name
//
//  Created by Artem Belov on 30.05.2023.
//

import XCTest

extension XCUIElement {
    func waitForExistence(timeOut: TimeOut) -> Bool {
        waitForExistence(timeout: timeOut.rawValue)
    }

    /**
     Removes any current text in the field before typing in the new value
     - Parameter text: the text to enter into the field
     */
    func clearAndEnterText(text: String) {
        guard let stringValue = value as? String else {
            XCTFail("Tried to clear and enter text into a non string value")
            return
        }

        tap()

        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)

        typeText(deleteString)
        typeText(text)
    }

    /// Force tap element hidden behind other elements
    func forceTapElement() {
        if isHittable {
            tap()
        } else {
            let coordinate: XCUICoordinate = coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
            coordinate.tap()
        }
    }

    /// Force press element hidden behind other elements
    func forceLongPressElement() {
        if isHittable {
            tap()
        } else {
            let coordinate: XCUICoordinate = coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
            coordinate.press(forDuration: 3)
        }
    }
}
