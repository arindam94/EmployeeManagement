//
//  MockEmployeeListViewController.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 13/10/23.
//

import XCTest
@testable import EmployeeManagment

final  class MockEmployeeListViewController: EmployeeListViewDelegate {
    var showErrorAlert: Bool = false
    var showEmployeeList: Bool = false
    func showListOfEmployee(list: EmployeeData) {
        showEmployeeList = true
    }
    func showError(errorMessage: String) {
        showErrorAlert = true
    }
}
