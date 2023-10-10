//
//  StoryboardIdentifier.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 10/10/23.
//

import XCTest
@testable import EmployeeManagment

final class StoryboardIdentifierTests: XCTestCase {

    
    func testStoryBoardIdnetifier(){
        XCTAssertEqual(StoryboardIdentifier.employeeList.storyboardName, "Main")
    }
   
}
