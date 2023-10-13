//
//  EmployeeDetailsConfigurationTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 11/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeDetailsConfigurationTests: XCTestCase {
    func testEmployeeListConfiguration() {
        // given
        guard let employeeData = MockDataProvider.getEmployeeData()?.users?.first else {
            XCTFail("Failed on fetching data")
            return
        }
        let config = EmployeeDetailsConfigurator(employeeDetails: employeeData)
        // when
        let viewController = config.configureViewController()
        // then
        XCTAssertTrue(viewController.isKind(of: EmployeeDetailsViewController.self))
        guard let viewController = viewController as? EmployeeDetailsViewController else {
            XCTFail("Configuration issue of  EmployeeListViewController")
            return
        }
        XCTAssertNotNil( viewController.interactor)
    }
}
