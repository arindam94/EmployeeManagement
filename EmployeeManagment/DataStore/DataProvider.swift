//
//  DateProvider.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation

protocol Dataprovider{
    var employeeDataList:[EmployeeInfo]{get}
    func employeeDataAt(index: Int)-> EmployeeInfo?
    func addEmployeedata(dataValue: EmployeeData)
}
