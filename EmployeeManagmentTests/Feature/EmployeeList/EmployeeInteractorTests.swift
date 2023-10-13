//
//  EmployeeInteractorTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeInteractorTests: XCTestCase {
    
    func testEmployeeListInteractor(){
        //Given
        let serrvice = EmployeeService(httpClient: MockHTPClient())
        let presenter = MockEmployeePresenter()
        let interactor = EmployeeInteractor(service: serrvice, presenter: presenter, dataStore: DataStore())
        
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
