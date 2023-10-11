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
        app.launch()
    }
    
    func testTableViewCellExists() {
        let app = XCUIApplication()
        app.launch()
        let tableView = app.tables["myTableViewIdentifier"]
        let cell = tableView.cells.element(boundBy: 0)
        cell.tap()
        let detailsTableView = app.tables["myDetailsTableViewIdentifier"]
        XCTAssertTrue(detailsTableView.exists, "The table view doesn't exist")
    }
}
