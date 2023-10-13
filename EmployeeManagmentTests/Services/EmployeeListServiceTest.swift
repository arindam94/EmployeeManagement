//
//  EmployeeListServiceTest.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeListServiceTest: XCTestCase {
    var employeeService: EmployeeService?
    override func setUpWithError() throws {
        employeeService = EmployeeService(httpClient: MockHTPClient())
    }
    override func tearDownWithError() throws {
        employeeService = nil
    }
    func testEmployeeListSuccessResponse() {
        let expextation = XCTestExpectation(description: "Loading Employee data")
        Task {
            do {
                let emplopyeeData = try await employeeService?.fetchEmployeeData()
                expextation.fulfill()
                XCTAssertEqual(emplopyeeData?.users?.count, 1)
            } catch {
                XCTFail("Failed to load data")
            }
        }
    }
}
