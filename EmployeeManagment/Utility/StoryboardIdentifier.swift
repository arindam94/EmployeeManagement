//
//  StoryboardIdentifier.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation

enum Storyboard: String{
    case main = "Main"
}


enum StoryboardIdentifier: String{
    case employeeList
    case employeeDetails
    
    var storyboardName: String{
        switch self{
        case.employeeList, .employeeDetails:
            return  Storyboard.main.rawValue
        }
    }
}
