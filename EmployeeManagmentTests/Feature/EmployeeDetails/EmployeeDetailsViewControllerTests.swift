//
//  EmployeeDetailsViewControllerTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 11/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeDetailsViewControllerTests: XCTestCase {
    func testEmployeeDataListViewControllerDataLoading() {
        // given
        let viewController: EmployeeDetailsViewController = UIStoryboard.instantiate(identifier: .employeeDetails)
        let interactor = MockEmployeeDetailsInteractor()
        viewController.interactor = interactor
        // when
        viewController.viewWillAppear(true)
        // then
        XCTAssertTrue(interactor.showEmployeeDataExecuted)
    }
}
