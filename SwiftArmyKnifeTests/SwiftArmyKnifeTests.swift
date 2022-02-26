//
//  SwiftArmyKnifeTests.swift
//  SwiftArmyKnifeTests
//
//  Created by Jeremy Warren on 2/26/22.
//

import XCTest
@testable import SwiftArmyKnife

class JournalModelTests: XCTestCase {
    func testCreateEntry() {
        // Setup
        let model = JournalModel()
        
        // Verify the inital state
        XCTAssertTrue(model.entries.isEmpty)
        
        // Perform the test
        model.createEntry(title: "create", contents: "")
        
        // Verify final state
        XCTAssertEqual(model.entries.first?.title, "create")
    }
    
    func testUpdateEntry() {
        let model = JournalModel()
        model.createEntry(title: "", contents: "")
        guard let entry = model.entries.first else { return XCTFail("entry was nil") }
        
        XCTAssertEqual(entry.title, "")
        XCTAssertEqual(entry.contents, "")
        
        model.update(entry: entry, title: "update", contents: "update contents")
        
        XCTAssertEqual(entry.title, "update")
        XCTAssertEqual(entry.contents, "update contents")
    }
    
    func testDeleteEntry() {
        let model = JournalModel()
        model.createEntry(title: "", contents: "")
        
        XCTAssertEqual(model.entries.count, 1)
        
        let indexSet = IndexSet(integer: 0)
        model.delete(indexSet: indexSet)
        
        XCTAssertTrue(model.entries.isEmpty)
    }
}
