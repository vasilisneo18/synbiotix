//
//  synbiotixTests.swift
//  synbiotixTests
//
//  Created by Vasilis Neophytou on 20/10/2023.
//

import XCTest
@testable import synbiotix

final class synbiotixTests: XCTestCase {

    private var menuSut: MenuVM!
    private var receiptSut: ReceiptVM!
    private var frosting: Frosting!
    private var filling: Filling?
    
    override func setUp() {
        menuSut = .init()
    }
    
    override func tearDown() {
        super.tearDown()
        menuSut = nil
        receiptSut = nil
        frosting = nil
        filling = nil
    }
    
    func testDisabledOrderButton() {
        menuSut.selectedFrosting = nil
        XCTAssertEqual(menuSut.isOrderEnabled, false)
    }
    
    func testEnabledOrderButton() {
        frosting = .init(name: " Chocolate", price: 1.75)
        menuSut.selectedFrosting = frosting
        XCTAssertEqual(menuSut.isOrderEnabled, true)
    }
    
    func testResultWithStrawbberyOnly() {
        frosting = .init(name: "Strawbbery", price: 2)
        receiptSut = .init(with: frosting, and: filling)
        XCTAssertEqual(receiptSut.totalPrice, "Total price: €2.00")
    }
    
    func testResultWithSaltedCaramelOnly() {
        frosting = .init(name: "Salted Caramel", price: 2.5)
        receiptSut = .init(with: frosting, and: filling)
        XCTAssertEqual(receiptSut.totalPrice, "Total price: €2.50")
    }
    
    func testResultWithCinammonSugarOnly() {
        frosting = .init(name: "Cinnamon Sugar", price: 3.1)
        receiptSut = .init(with: frosting, and: filling)
        XCTAssertEqual(receiptSut.totalPrice, "Total price: €3.10")
    }
    
    func testResultWithChocolateOnly() {
        frosting = .init(name: " Chocolate", price: 1.75)
        receiptSut = .init(with: frosting, and: filling)
        XCTAssertEqual(receiptSut.totalPrice, "Total price: €1.75")
    }
    
    func testResultWithChocolateAndVanilla() {
        frosting = .init(name: " Chocolate", price: 1.75)
        filling = .init(name: "Vanilla", price: 1.5)
        receiptSut = .init(with: frosting, and: filling)
        XCTAssertEqual(receiptSut.totalPrice, "Total price: €3.25")
    }
    
    func testResultWithCinnamonSugarAndVanilla() {
        frosting = .init(name: " Cinnamon Sugar", price: 3.1)
        filling = .init(name: "Vanilla", price: 1.5)
        receiptSut = .init(with: frosting, and: filling)
        XCTAssertEqual(receiptSut.totalPrice, "Total price: €4.60")
    }
    
}
