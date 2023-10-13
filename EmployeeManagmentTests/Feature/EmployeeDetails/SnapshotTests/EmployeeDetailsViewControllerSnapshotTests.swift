//
//  EmployeeDetailsViewControllerSnapshotTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 13/10/23.
//

import XCTest
import iOSSnapshotTestCase
import iOSSnapshotTestCaseCore
@testable import EmployeeManagment

final class EmployeeDetailsViewControllerSnapshotTests: FBSnapshotTestCase {
    var employeeDetailsViewController: EmployeeDetailsViewController!
    var navigationController: UINavigationController!
    var sceneDelegate: SceneDelegate!
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    override func tearDownWithError() throws {
        employeeDetailsViewController     = nil
        navigationController                  = nil
        sceneDelegate                            = nil
    }
    
    func testEmployeeListViewControlleWithNoResult() throws {
        loadViewController()
        let expectation = expectation(description: "Employeelist DetailsviewController")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            expectation.fulfill()
            self.FBSnapshotVerifyViewController(self.navigationController)
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    private func loadViewController() {
        guard let employeeInfo = MockDataProvider.getEmployeeData()?.users?.first else{
            XCTFail("Unable to load data")
            return
        }
        let configurator = EmployeeDetailsConfigurator(employeeDetails: employeeInfo)
        guard let viewController = configurator.configureViewController() as? EmployeeDetailsViewController else{
            XCTFail("failed to load view controller")
            return
        }
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate else{
            return
        }
        self.employeeDetailsViewController = viewController
        self.sceneDelegate = sceneDelegate
        navigationController = UINavigationController(rootViewController: viewController)
        self.sceneDelegate.window?.rootViewController = navigationController
    }
}
