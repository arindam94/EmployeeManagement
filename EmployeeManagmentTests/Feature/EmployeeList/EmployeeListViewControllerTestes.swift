


//
//  EmployeeListViewControllerTestes.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeListViewControllerTestes: XCTestCase {
    func testEmployeeDataListViewControllerDataLoading(){
        //Given
        let viewController: EmployeeListViewController = UIStoryboard.instantiate(identifier: .employeeList)
        let interactor = MockEmployeeInteractor()
        viewController.interactor = interactor
        
        //When
        viewController.viewDidLoad()
        
        //then
        let expectation = expectation(description: "Employeelist viewController")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            expectation.fulfill()
            XCTAssertTrue(interactor.employeeListDataExecuted)
        }
        wait(for: [expectation], timeout: 2.0)
    }
}
