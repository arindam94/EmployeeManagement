//
//  EmployeeListViewControllerTestes.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment

private final class  MockEmployeeInteractor: EmployeeListInteractor{
    var employeeListDataExecuted: Bool = false
    
    func getListofEmployee() {
        employeeListDataExecuted = true
    }
    
    
}

final class EmployeeListViewControllerTestes: XCTestCase {

    var employeeListViewController: EmployeeListViewController!
    var navigationController: UINavigationController!
    var sceneDelegate: SceneDelegate!
    
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
         employeeListViewController     = nil
         navigationController                  = nil
         sceneDelegate                            = nil
    }

    func testEmployeeDataListViewControllerDataLoading(){
        //Given
        let viewController: EmployeeListViewController = UIStoryboard.instantiate(identifier: .employeeList)
        let interactor = MockEmployeeInteractor()
        viewController.interactor = interactor
        
        //When
        viewController.viewWillAppear(true)
        
        //then
        XCTAssertTrue(interactor.employeeListDataExecuted)
    }
    
    
    

}
