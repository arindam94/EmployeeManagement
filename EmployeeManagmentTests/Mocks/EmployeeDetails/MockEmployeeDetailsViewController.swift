//
//  MockEmployeeDetailsViewController.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 13/10/23.
//

import XCTest
@testable import EmployeeManagment

final class MockEmployeeDetailsViewController: EmployeeDetailsViewDelegate {
    var showEmployeeDetailsExecuted: Bool = false
    
    func showEmployeeDetails(info: EmployeeManagment.EmployeeInfo) {
        showEmployeeDetailsExecuted = true
    }
}
