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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        employeeService = EmployeeService(httpClient: MockHTPClient())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        employeeService = nil
    }

    func testEmployeeListSuccessResponse(){
        //given
        let expextation = XCTestExpectation(description: "Loading Employee data")
        
        Task{
            do{
                let emplopyeeData = try await employeeService?.fetchEmployeeData()
                expextation.fulfill()
                debugPrint(emplopyeeData?.users?.count)
                XCTAssertEqual(emplopyeeData?.users?.count, 1)
            }
            catch{
                XCTFail("Failed to load data")
            }
        }
    }

}
