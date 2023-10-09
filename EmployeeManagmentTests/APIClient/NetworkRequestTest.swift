//
//  NetworkRequestTest.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment
final class NetworkRequestTest: XCTestCase {

    func testNetworkRequestForEmployeeData(){
        //when
        let networkRequest = NetworkRequest<EmployeeData>.employeeDataRequest()
        
        //then
        XCTAssertEqual(networkRequest.url, "https://dummyjson.com/users")
        XCTAssertEqual(networkRequest.parameters.count, 0)
        let request = networkRequest.request
        XCTAssertNotNil(request)
    }

}
