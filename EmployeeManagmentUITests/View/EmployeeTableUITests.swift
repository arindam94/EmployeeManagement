//
//  EmployeeTableUITests.swift
//  EmployeeManagmentUITests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment



class EmployeeTableUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch() // Launch your app
    }
    
    func testTableViewCellExists() {
        let app = XCUIApplication()
        app.launch() // Launch your app
        
        // Access the table view
        let tableView = app.tables["myTableViewIdentifier"]
        
        // Check if the table view exists
        XCTAssertTrue(tableView.exists, "The table view doesn't exist")
        
    }

}
