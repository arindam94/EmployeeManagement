//
//  MockEmployeeInteractor.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 13/10/23.
//

import XCTest
@testable import EmployeeManagment

 final class  MockEmployeeInteractor: EmployeeListInteractor {
    func showEmployeeDetails(index: Int) {
    }
    
    var employeeListDataExecuted: Bool = false
    
    func getListofEmployee() {
        employeeListDataExecuted = true
    }
}
