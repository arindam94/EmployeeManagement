//
//  DateProvider.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation

protocol Dataprovider{
    var employeeDateList:[EmployeeData]{get}
    func employeeDataAt(index: Int)-> EmployeeData?
    
}
