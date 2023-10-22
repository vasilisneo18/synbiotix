//
//  MenuScreen.swift
//  synbiotix
//
//  Created by Vasilis Neophytou on 22/10/2023.
//

import XCTest

class MenuScreen {
    
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var frostingOptionViewItem: XCUIElement {
       app.otherElements[ScreenIdentifier.MenuView.frostingOptionViewItem.rawValue]
    }

    var frostingOptionsView: XCUIElement {
       app.otherElements[ScreenIdentifier.MenuView.frostingOptionsView.rawValue]
    }
    
    var fillingOptionViewItem: XCUIElement {
       app.otherElements[ScreenIdentifier.MenuView.fillingOptionViewItem.rawValue]
    }
    
    var fillingOptionsView: XCUIElement {
       app.otherElements[ScreenIdentifier.MenuView.fillingOptionsView.rawValue]
    }
    
    var finishOrderButton: XCUIElement {
       app.buttons[ScreenIdentifier.MenuView.finishOrderButton.rawValue]
    }
    
}
