//
//  EmployeeDetailsCellTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 11/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeDetailsCellTests: XCTestCase {
    
    func testEmployeeCell() {
        let nib = UINib(nibName: "EmployeeDetailsCell", bundle: Bundle(for: EmployeeDetailsCell.self))
        if let cell = nib.instantiate(withOwner: self, options: nil).first as? EmployeeDetailsCell{
            if let employeeData = MockDataProvider.getEmployeeData()?.users?.first{
                cell.employeeDetails = employeeData
                XCTAssertEqual(cell.accessoryType, .none)
            }
        }
    }
}



