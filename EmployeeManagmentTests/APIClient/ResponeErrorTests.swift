//
//  ResponeErrorTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment

final class ResponeErrorTests: XCTestCase {
    
    func testResponeError(){
        XCTAssertEqual(ResponseError.decode.errorDescription, "Employee  data not found.")
        XCTAssertEqual(ResponseError.invalidURL.errorDescription, "Endpoint is not valid.")
        XCTAssertEqual(ResponseError.unexpectedStatusCode.errorDescription, "Unknown error occured.\nPlease try again.")
    }
}
