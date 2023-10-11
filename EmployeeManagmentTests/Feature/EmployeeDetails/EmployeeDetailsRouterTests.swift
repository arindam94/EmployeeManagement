//
//  EmployeeDetailsRouter.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment


final class EmployeeDetailsRouterTests: XCTestCase {

    var viewCotroller: UIViewController!
    override func setUpWithError() throws {
        viewCotroller = UIStoryboard.instantiate(identifier: .employeeList)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewCotroller = nil
    }

    
    
    func testEmployeeDetailsRouter(){
        //Given
        let router = EmployeeDetailsRouter(viewController: viewCotroller)
        
        XCTAssertNotNil(router)
    }

}
