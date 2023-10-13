//
//  EmployeeListPresenterTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeListPresenterTests: XCTestCase {
    func testEmployeeListPresenter() {
        //given
        let view = MockEmployeeListViewController()
        let router = MockEmployeeListRouter()
        let presenter = EmployeePresenter(view: view, router: router)
        
        //when
        guard let  mockResponse = MockDataProvider.getEmployeeData() else{
            XCTFail("Failed on fetching data")
            return
        }
        presenter.employeeListUpdate(list: mockResponse )
        
        //Then
        let expectation = expectation(description: "testEmployeePresenter")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertTrue(view.showEmployeeList)
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    
    func testEmployeeListPresenterWithError() {
        //given
        let view = MockEmployeeListViewController()
        let router = MockEmployeeListRouter()
        let presenter = EmployeePresenter(view: view, router: router)
        
        //when
        presenter.employeeRequestFailed(description: "Error ")
        
        //Then
        let expectation = expectation(description: "testEmployeePresenter")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertTrue(view.showErrorAlert)
        }
        wait(for: [expectation], timeout: 1)
    }
    
    
    func testEmployeeListPresenterShowEmployeeDetails() {
        //given
        let view = MockEmployeeListViewController()
        let router = MockEmployeeListRouter()
        let presenter = EmployeePresenter(view: view, router: router)
        
        //when
        guard let mockEMployeeData = MockDataProvider.getEmployeeData()?.users?.first else{
            XCTFail("Failed to provide data")
            return
        }
        presenter.showEmployeeDetails(info: mockEMployeeData)
        
        //Then
        let expectation = expectation(description: "testEmployeePresenter")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertTrue(router.showEmployeeDetailsExecuted)
        }
        wait(for: [expectation], timeout: 1)
    }
}
