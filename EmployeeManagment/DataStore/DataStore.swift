//
//  DataStore.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation

//MARK: DataStore
final class DataStore {
    private var data: [EmployeeInfo] = []
}

//MARK: Data Provider protocol implementation
extension DataStore: Dataprovider {
    func addEmployeedata(dataValue: EmployeeData) {
        guard let users = dataValue.users else{return}
        self.data = users
    }
    
    var employeeDataList: [EmployeeInfo] {
        data
    }
    
    func employeeDataAt(index: Int) -> EmployeeInfo? {
        return data[index]
    }
}
