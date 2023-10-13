//
//  MockEmployeeDetailsPresenter.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 13/10/23.
//

import XCTest
@testable import EmployeeManagment

final  class MockEmployeeDetailsPresenter: EmployeeDetailsPresenterInterface {
    var updateEmployeeDetailsExecuted: Bool = false
    func updateEmployeeDetails() {
        updateEmployeeDetailsExecuted = true
    }
}
