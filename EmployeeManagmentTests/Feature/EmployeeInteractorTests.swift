//
//  EmployeeInteractorTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment

private class MockEmployeePresenter: EmployeePresenterInterface{
    
    var showErroAlertExecuted: Bool = false
    var showEmployeeLisExecutedt: Bool = false
    func employeeListUpdate(list: EmployeeData) {
        showEmployeeLisExecutedt = true
    }
    
    func employeeRequestFailed(description: String) {
        showErroAlertExecuted = true
    }
    
    
}


final class EmployeeInteractorTests: XCTestCase {

    func testEmployeeListInteractor(){
        //Given
        let serrvice = EmployeeService(httpClient: MockHTPClient())
        let presenter = MockEmployeePresenter()
        let interactor = EmployeeInteractor(service: serrvice, presentter: presenter, datsStore: DataStore())
        
        //When
        interactor.getListofEmployee()
        
        //then
        let expectation = expectation(description: "EmployeePresenter")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertTrue(presenter.showEmployeeLisExecutedt)
        }
        wait(for: [expectation], timeout: 0.2)
    }
    
}
