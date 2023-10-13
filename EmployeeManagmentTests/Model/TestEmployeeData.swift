//
//  TestEmployeeData.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment
final class TestEmployeeData: XCTestCase {
    func testEmployeeDataParsing() {
        do {
            // given
            let data = try  TestUtils.dataValue(fromResource: "EmployeeDataRespone", ext: "json")
            // when
            let employee = try? JSONDecoder().decode(EmployeeData.self, from: data)
            // then
            if let employee = employee {
                XCTAssertEqual(employee.users?.count, 1)
            } else {
                XCTFail("Respone decoding failed")
            }
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
}
