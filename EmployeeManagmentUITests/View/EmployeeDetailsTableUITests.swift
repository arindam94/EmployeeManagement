//
//  EmployeeDetailsTableUITests.swift
//  EmployeeManagmentUITests
//
//  Created by Arindam Santra on 11/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeDetailsTableUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch() // Launch your app
    }

    
    func testTableViewCellExists() {
        let app = XCUIApplication()
        app.launch() // Launch your app
        
        // Access the table view
        let tableView = app.tables["myDetailsTableViewIdentifier"]
        
        // Check if the table view exists
        XCTAssertTrue(tableView.exists, "The table view doesn't exist")
        
    }
}
