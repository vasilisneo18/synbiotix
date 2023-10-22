//
//  ReceiptScreen.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 22/10/2023.
//

import XCTest

class ReceiptScreen {
    
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var orderSummaryLabel: XCUIElement {
       app.staticTexts[ScreenIdentifier.ReceiptView.orderSummaryLabel.rawValue]
    }
    
    var totalPriceLabel: XCUIElement {
       app.staticTexts[ScreenIdentifier.ReceiptView.totalPriceLabel.rawValue]
    }
    
    var orderAgainButton: XCUIElement {
        app.buttons[ScreenIdentifier.ReceiptView.orderAgainButton.rawValue]
    }
}
