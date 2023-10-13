//
//  MockEmployeePresenter.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 13/10/23.
//

import XCTest
@testable import EmployeeManagment

final class MockEmployeePresenter: EmployeePresenterInterface {
    func showEmployeeDetails(info: EmployeeManagment.EmployeeInfo) {
    }
    var showErroAlertExecuted: Bool = false
    var showEmployeeLisExecutedt: Bool = false
    func employeeListUpdate(list: EmployeeData) {
        showEmployeeLisExecutedt = true
    }
    func employeeRequestFailed(description: String) {
        showErroAlertExecuted = true
    }
}
