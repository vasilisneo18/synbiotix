//
//  synbiotixUITests.swift
//  synbiotixUITests
//
//  Created by Vasilis Neophytou on 20/10/2023.
//

import XCTest

final class synbiotixUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    private var menuScreen: MenuScreen {
        MenuScreen(app: app)
    }
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = .init()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func test_list_has_correct_amount_of_frosting_itmes_on_the_screen() {
        let frostingOptionsView = menuScreen.frostingOptionsView
        XCTAssertTrue(frostingOptionsView.waitForExistence(timeout: 3), "Frosting option views should be visible")

        let predicate = NSPredicate(format: "identifier CONTAINS '\(ScreenIdentifier.MenuView.frostingOptionViewItem)'")
        let listItems = frostingOptionsView.otherElements.containing(predicate)
        XCTAssertEqual(listItems.count, 4, "There should be 4 frosting items on the screen")
    }
    
    func test_list_has_correct_amount_of_filling_itmes_on_the_screen() {
        let fillingOptionsView = menuScreen.fillingOptionsView
        XCTAssertTrue(fillingOptionsView.waitForExistence(timeout: 3), "Filling option views should be visible")

        let predicate = NSPredicate(format: "identifier CONTAINS '\(ScreenIdentifier.MenuView.fillingOptionViewItem)'")
        let listItems = fillingOptionsView.otherElements.containing(predicate)
        XCTAssertEqual(listItems.count, 4, "There should be 4 filling items on the screen")
    }
    
    
    
}
