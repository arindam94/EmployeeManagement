//
//  MockEmployeeListRouter.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 13/10/23.
//

import XCTest
@testable import EmployeeManagment

final class MockEmployeeListRouter: EmployeeListRouting {
    var showEmployeeDetailsExecuted: Bool = false
    func showEmployeeDetails(employeeData: EmployeeManagment.EmployeeInfo) {
        showEmployeeDetailsExecuted = true
    }
}
