//
//  EmployeeListRoterTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment




final class EmployeeListRouterTests: XCTestCase {

    var viewController: UIViewController!
    var navigationController: UINavigationController!

    
    override func setUpWithError() throws {
         viewController = UIStoryboard.instantiate(identifier: .employeeList)
        navigationController = UINavigationController(rootViewController: viewController)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
        navigationController = nil
    }

    
    func testEmployeeListRouter(){
        
        let router = EmployeeRouter(viewController: viewController)
        if  let mockData = MockDataProvider.getEmployeeData()?.users?.first{
            router.showEmployeeDetails(employeeData: mockData)
        }
        let expectation = expectation(description: "testEmployeeRouter")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            expectation.fulfill()
            XCTAssertNotNil(navigationController.topViewController)
            let topViewController = navigationController.topViewController

            XCTAssertTrue(topViewController!.isKind(of: EmployeeDetailsViewController.self))

        }
        wait(for: [expectation], timeout: 3)

    }
    
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
