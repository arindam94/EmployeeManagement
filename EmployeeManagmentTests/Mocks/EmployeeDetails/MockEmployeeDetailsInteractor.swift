//
//  MockEmployeeDetailsInteractor.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 13/10/23.
//

import XCTest
@testable import EmployeeManagment

final class  MockEmployeeDetailsInteractor: EmployeeDetailsInteractorInterface {
    var showEmployeeDataExecuted = false
    func showEmployeeData() {
        showEmployeeDataExecuted = true
    }
}
