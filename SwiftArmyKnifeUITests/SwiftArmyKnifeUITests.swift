//
//  SwiftArmyKnifeUITests.swift
//  SwiftArmyKnifeUITests
//
//  Created by Jeremy Warren on 2/26/22.
//

import XCTest

class PokedexUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
    }
    
    func testSearchByID() {
        app.buttons.matching(identifier: "Pokedex").firstMatch.tap()
        XCTAssertTrue(app.textFields.firstMatch.waitForExistence(timeout: 5))
        
        XCTAssertTrue(app.staticTexts.matching(identifier: "Pokedex").firstMatch.exists)
        XCTAssertFalse(app.images.firstMatch.exists)
        
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText("151")
        app.buttons.matching(identifier: "Search").firstMatch.tap()
        
        XCTAssertTrue(app.images.firstMatch.waitForExistence(timeout: 10))
        XCTAssertTrue(app.staticTexts.matching(identifier: "MEW").firstMatch.exists)
    }
    
}

