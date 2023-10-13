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
        //Given
        guard let employeeData = MockDataProvider.getEmployeeData()?.users?.first else{
            XCTFail("Failed on fetching data")
            return
        }
        let config = EmployeeDetailsConfigurator(employeeDetails: employeeData)
        
        //When
        let viewController = config.configureViewController()
        
        //then
        XCTAssertTrue(viewController.isKind(of: EmployeeDetailsViewController.self))
        
        if let viewController = viewController as? EmployeeDetailsViewController {
            XCTAssertNotNil(viewController.interactor)
        }
        else{
            XCTFail("Configuration issue of  EmployeeListViewController")
        }
    }
}
