//
//  BaseScreen.swift
//  Scheme name
//
//  Created by Artem Belov on 30.05.2023.
//

import XCTest

class BaseScreen {
    let app: XCUIApplication
    let expectedElement: XCUIElement?

    init(app: XCUIApplication, expectedElement: XCUIElement?, file: StaticString = #filePath, line: UInt = #line) {
        self.app = app
        self.expectedElement = expectedElement

        waitForScreen(file: file, line: line)
    }

    static let springboard: XCUIApplication = .init(
        bundleIdentifier: "com.apple.springboard"
    )

    /// Waits for `expectedElement` to change it's state to `isEnabled`
    ///
    /// - Parameters:
    ///   - timeout: The specificied amount of time to check expected elements.
    func waitForScreen(timeout: TimeInterval = TimeOut.medium.rawValue, file: StaticString = #file, line: UInt = #line) {
        guard let expectedElement else {
            print("No expected element was found for screen \(self). Skipping")
            return
        }

        let activityDescription = "Verifying screen \(self) is loaded"

        XCTContext.runActivity(named: activityDescription) { _ in
            let result = waitFor(
                element: expectedElement,
                predicate: "isEnabled == true",
                timeout: timeout
            )

            guard result == .completed else {
                XCTFail("Screen \(self) is not loaded. Missing element: \(expectedElement)", file: file, line: line)
                return
            }
        }
    }

    private func waitFor(element: XCUIElement, predicate: String, timeout: TimeInterval) -> XCTWaiter.Result {
        XCTWaiter.wait(
            for: [
                XCTNSPredicateExpectation(
                    predicate: NSPredicate(format: predicate),
                    object: element
                ),
            ],
            timeout: timeout
        )
    }
}
