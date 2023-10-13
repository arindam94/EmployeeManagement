//
//  EmployeeTableUITests.swift
//  EmployeeManagmentUITests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeTableUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
    }
    func testTableViewCellExists() {
        let app = XCUIApplication()
        app.launch()
        // Access the table view
        let tableView = app.tables["myTableViewIdentifier"]
        // Check if the table view exists
        XCTAssertTrue(tableView.exists, "The table view doesn't exist")
    }
}
