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
    
    private var receiptScreen: ReceiptScreen {
        ReceiptScreen(app: app)
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
    
    func test_strawbbery_frosting_selection_total_price() {
        XCTAssertFalse(menuScreen.finishOrderButton.isEnabled, "Button should be disabled")
        menuScreen.strawbberyFrostingOptionsView.tap()
        XCTAssertTrue(menuScreen.finishOrderButton.isEnabled, "Button should be enabled")
        menuScreen.finishOrderButton.tap()
        XCTAssertEqual(receiptScreen.totalPriceLabel.label, "Total price: €2.00")
    }
    
    func test_strawbbery_frosting_with_chocolate_filling_selection_total_price() {
        XCTAssertFalse(menuScreen.finishOrderButton.isEnabled, "Button should be disabled")
        menuScreen.strawbberyFrostingOptionsView.tap()
        XCTAssertTrue(menuScreen.finishOrderButton.isEnabled, "Button should be enabled")
        menuScreen.chocolateFillingOptionsView.tap()
        menuScreen.finishOrderButton.tap()
        XCTAssertEqual(receiptScreen.totalPriceLabel.label, "Total price: €3.50")
    }
    
    func test_strawbbery_frosting_with_chocolate_filling_selection_order_summary() {
        menuScreen.chocolateFillingOptionsView.tap()
        XCTAssertFalse(menuScreen.finishOrderButton.isEnabled, "Button should be disabled")
        menuScreen.strawbberyFrostingOptionsView.tap()
        XCTAssertTrue(menuScreen.finishOrderButton.isEnabled, "Button should be enabled")
        menuScreen.finishOrderButton.tap()
        XCTAssertEqual(receiptScreen.orderSummaryLabel.label, "Strawbbery donut\nwith Chocolate filling")
    }
    
    func test_order_again_resets_values() {
        menuScreen.chocolateFillingOptionsView.tap()
        menuScreen.strawbberyFrostingOptionsView.tap()
        XCTAssertTrue(menuScreen.finishOrderButton.isEnabled, "Button should be enabled")
        menuScreen.finishOrderButton.tap()
        XCTAssertEqual(receiptScreen.orderSummaryLabel.label, "Strawbbery donut\nwith Chocolate filling")
        receiptScreen.orderAgainButton.tap()
        XCTAssertFalse(menuScreen.finishOrderButton.isEnabled, "Button should be disabled")
    }
    
}
