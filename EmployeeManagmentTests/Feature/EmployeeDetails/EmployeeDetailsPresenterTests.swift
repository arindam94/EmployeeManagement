//
//  EmployeeDetailsPresenterTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeDetailsPresenterTests: XCTestCase {
    
    func testEmployeeDetailsPresenter() {
        //given
        let view = MockEmployeeDetailsViewController()
        let router = EmployeeDetailsRouter(viewController: UIViewController())
        
        //when
        guard let  mockResponse = MockDataProvider.getEmployeeData()?.users?.first else{
            XCTFail("Failed on fetching data")
            return
        }
        let presenter = EmployeeDetailsPresenter(router: router, view: view, employeeDetails: mockResponse)
        presenter.updateEmployeeDetails()
        
        //Then
        let expectation = expectation(description: "testEmployeeDetailsPresenter")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertTrue(view.showEmployeeDetailsExecuted)
        }
        wait(for: [expectation], timeout: 1)
    }
}
