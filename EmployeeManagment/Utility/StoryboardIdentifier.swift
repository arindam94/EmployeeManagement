//
//  StoryboardIdentifier.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation

//MARK: Storyboard Name
enum Storyboard: String {
    case main = "Main"
}

//MARK: Enum for storyboard identifier
enum StoryboardIdentifier: String {
    case employeeList
    case employeeDetails
    
    var storyboardName: String {
        switch self {
        case.employeeList, .employeeDetails:
            return  Storyboard.main.rawValue
        }
    }
}
