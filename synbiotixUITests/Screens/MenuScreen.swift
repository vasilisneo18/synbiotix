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
    
    var strawbberyFrostingOptionsView: XCUIElement {
        app.otherElements["\(ScreenIdentifier.MenuView.frostingOptionViewItem.rawValue)_0"]
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
    
    var chocolateFillingOptionsView: XCUIElement {
        app.otherElements["\(ScreenIdentifier.MenuView.fillingOptionViewItem.rawValue)_1"]
    }
    
}
