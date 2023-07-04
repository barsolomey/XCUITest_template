//
//  UITests.swift
//  Scheme name
//
//  Created by Artem Belov on 30.05.2023.
//

import XCTest

class UITests: BaseTest {
    override func setUpWithError() throws {
        //        Optional configurations to be added here
        //        configurations = []

        try super.setUpWithError()
    }

    // MARK:  Mark your tests here

    /// Describe the test functionality briefly. Add test case number from TestRail to the end of the  function
    func testNameOfTheTest_TESTNUMBER() {
        // SomeScreen init then use SomeScreen class method
        let someScreen = SomeScreen(app: app)
        someScreen.doThis()
        // another screen init and use of AnotherScreen method
	let anotherScreen = AnotherScreen(app: app)
        AnotherScreen.doThat()
        anotherScreen.verifyThis()
    }
}
