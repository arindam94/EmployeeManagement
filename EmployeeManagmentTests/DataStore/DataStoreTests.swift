//
//  DataStoreTests.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment

final class DataStoreTests: XCTestCase {
    var dataStore: DataStore!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataStore = DataStore()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dataStore = nil
    }
    
    func testDataStoreAddEmployeeData(){
        //Given
        guard let employeeList =  MockDataProvider.getEmployeeData() else{
            XCTFail("Fail to provide mock Data")
            return
        }
        XCTAssertTrue(dataStore.employeeDataList.isEmpty)
        //When
        dataStore.addEmployeedata(dataValue: employeeList)
        //then
        XCTAssertFalse(dataStore.employeeDataList.isEmpty)
        XCTAssertFalse(dataStore.employeeDataList.isEmpty)
    }
}
