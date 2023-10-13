//
//  EmployeeListViewControllerSnapshotTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 13/10/23.
//

import XCTest
import iOSSnapshotTestCase
import iOSSnapshotTestCaseCore
@testable import EmployeeManagment

final class EmployeeListViewControllerSnapshotTests: FBSnapshotTestCase {
    var employeeListViewController: EmployeeListViewController!
    var navigationController: UINavigationController!
    var sceneDelegate: SceneDelegate!
    
    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    override func tearDownWithError() throws {
        employeeListViewController     = nil
        navigationController                  = nil
        sceneDelegate                            = nil
    }
    
    func testEmployeeListViewControlleWithNoResult() throws{
        loadViewController()
        employeeListViewController.showError(errorMessage: "error message")
        let expectation = expectation(description: "Employeelist viewController")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            expectation.fulfill()
            self.FBSnapshotVerifyViewController(self.navigationController)
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    func testEmployeeListViewControlleWithError() throws{
        loadViewController()
        employeeListViewController.loadViewIfNeeded()
        employeeListViewController.showError(errorMessage: "error message")
        let expectation = expectation(description: "Employeelist viewController")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            expectation.fulfill()
            
            self.FBSnapshotVerifyViewController(self.navigationController.presentedViewController!)
        }
        wait(for: [expectation], timeout: 2.0)
    }
    
    private func loadViewController(){
        let service = EmployeeService(httpClient: MockHTPClient())
        let configurator = EmployeeConfigurator(service: service, dataStore: DataStore())
        guard let viewController = configurator.configureViewController() as? EmployeeListViewController else{
            XCTFail("failed to load view controller")
            return
        }
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let sceneDelegate = windowScene.delegate as? SceneDelegate else{
            return
        }
        self.employeeListViewController = viewController
        self.sceneDelegate = sceneDelegate
        navigationController = UINavigationController(rootViewController: viewController)
        self.sceneDelegate.window?.rootViewController = navigationController
    }
}
