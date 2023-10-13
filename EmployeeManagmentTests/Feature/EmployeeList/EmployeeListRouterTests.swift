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
    func testEmployeeListRouter() {
        let router = EmployeeRouter(viewController: viewController)
        if  let mockData = MockDataProvider.getEmployeeData()?.users?.first {
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
}
