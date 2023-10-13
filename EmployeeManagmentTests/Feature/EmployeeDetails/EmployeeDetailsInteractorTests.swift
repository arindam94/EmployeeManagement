//
//  EmployeeDetailsInteractorTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeDetailsInteractorTests: XCTestCase {
    
    func testEmployeeListInteractor() {
        //Given
        let presenter = MockEmployeeDetailsPresenter()
        let interactor = EmployeeDetailsInteractor(presenter: presenter)
        
        //When
        interactor.showEmployeeData()
        
        //then
        let expectation = expectation(description: "testEmployeeDetailsInteractor")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            expectation.fulfill()
            XCTAssertTrue(presenter.updateEmployeeDetailsExecuted)
        }
        wait(for: [expectation], timeout: 0.2)
    }
}
