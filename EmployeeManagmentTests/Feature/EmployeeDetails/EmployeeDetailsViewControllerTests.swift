//
//  EmployeeDetailsViewControllerTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 11/10/23.
//

import XCTest
@testable import EmployeeManagment

private final class  MockEmployeeDetailsInteractor: EmployeeDetailsInteractorInterface{
    var showEmployeeDataExecuted = false
    func showEmployeeData() {
        showEmployeeDataExecuted = true
    }
    
  
}

final class EmployeeDetailsViewControllerTests: XCTestCase {
    
    var employeeDetailsViewController: EmployeeDetailsViewController!
    var navigationController: UINavigationController!
    var sceneDelegate: SceneDelegate!
    
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        employeeDetailsViewController     = nil
         navigationController                  = nil
         sceneDelegate                            = nil
    }

    func testEmployeeDataListViewControllerDataLoading(){
        //Given
        let viewController: EmployeeDetailsViewController = UIStoryboard.instantiate(identifier: .employeeDetails)
        let interactor = MockEmployeeDetailsInteractor()
        viewController.interactor = interactor
        
        //When
        viewController.viewWillAppear(true)
        
        
        //then
        XCTAssertTrue(interactor.showEmployeeDataExecuted)
    }
    
    
    
}
