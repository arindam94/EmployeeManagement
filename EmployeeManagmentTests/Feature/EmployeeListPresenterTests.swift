//
//  EmployeeListPresenterTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment

private class MockEmployeeListViewController:EmployeeListViewInterface{
    var showErrorAlert: Bool = false
    var showEmployeeList: Bool = false
    
    func showListOfEmployee(list: EmployeeData) {
        
        showEmployeeList = true
    }
    
    func showError(errorMessage: String) {
        showErrorAlert = true
    }
    
}




final class EmployeeListPresenterTests: XCTestCase {

    func testEmployeeListPresenter() {
        //given
        let view = MockEmployeeListViewController()
        let router = EmployeeRouter(viewController: UIViewController())
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
        wait(for: [expectation], timeout: 0.2)
    }
    
    
    
    func testEmployeeListPresenterWithError() {
        //given
        let view = MockEmployeeListViewController()
        let router = EmployeeRouter(viewController: UIViewController())
        let presenter = EmployeePresenter(view: view, router: router)
        
        
        //when
        guard let  mockResponse = MockDataProvider.getEmployeeData() else{
            XCTFail("Failed on fetching data")
            return
        }
        presenter.employeeRequestFailed(description: "Error ")
        
        
        //Then
        let expectation = expectation(description: "testEmployeePresenter")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertTrue(view.showErrorAlert)
        }
        wait(for: [expectation], timeout: 0.2)
    }

}
