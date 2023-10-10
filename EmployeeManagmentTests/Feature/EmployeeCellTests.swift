//
//  EmployeeCellTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeCellTests: XCTestCase {

    func testEmployeeCell(){
        let nib = UINib(nibName: "EmployeeListCell", bundle: Bundle(for: EmployeeListCell.self))
        if let cell = nib.instantiate(withOwner: self, options: nil).first as? EmployeeListCell{
            if let employeeData = MockDataProvider.getEmployeeData()?.users?.first{
                cell.employeeDetails = employeeData
                XCTAssertEqual(cell.accessoryType, .disclosureIndicator)
            }
        }
    }
}
