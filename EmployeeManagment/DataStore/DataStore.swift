//
//  DataStore.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation

final class DataStore{
    private var data: [EmployeeData] = []
    
}


extension DataStore: Dataprovider{
    var employeeDateList: [EmployeeData] {
        data
    }
    
    func employeeDataAt(index: Int) -> EmployeeData? {
        return data[index]
    }
    
    
}
