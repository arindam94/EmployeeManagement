//
//  EmployeeListConfigurationTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment

final class EmployeeListConfigurationTests: XCTestCase {
    
    
    func testEmployeeListConfiguration() {
        //Given
        let datsource = DataStore()
        let service = EmployeeService(httpClient: MockHTPClient())
        let config = EmployeeConfigurator(service: service, dataStore: datsource)
        
        //When
        let viewController = config.configureViewController()
        
        //then
        XCTAssertTrue(viewController.isKind(of: EmployeeListViewController.self))
        
        if let viewController = viewController as? EmployeeListViewController{
            XCTAssertNotNil(viewController.interactor)
        }
        else{
            XCTFail("Configuration issue of  EmployeeListViewController")
        }
    }
}
