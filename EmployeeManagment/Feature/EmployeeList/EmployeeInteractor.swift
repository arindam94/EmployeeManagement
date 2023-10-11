//
//  EmployeeInteractor.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation

protocol EmployeeListInteractor {
    func getListofEmployee()
    func showEmployeeDetails(index: Int)
}


struct EmployeeInteractor {
    private let service: EmployeeService
    private let presentter: EmployeePresenterInterface
    private let datsStore: Dataprovider
    
    init(service: EmployeeService, presentter: EmployeePresenterInterface, datsStore: Dataprovider) {
        self.service = service
        self.presentter = presentter
        self.datsStore = datsStore
    }
    
}
extension EmployeeInteractor: EmployeeListInteractor {
    func showEmployeeDetails(index: Int) {
        if let employeeInfo = datsStore.employeeDataAt(index: index){
            presentter.showEmployeeDetails(info: employeeInfo)
        }
    }
    
    func getListofEmployee() {
        Task{
            do{
                if  let listData =  try await service.fetchEmployeeData(){
                    datsStore.addEmployeedata(dataValue: listData)
                    presentter.employeeListUpdate(list: listData)
                }
            }
            catch let error as ResponseError {
                presentter.employeeRequestFailed(description: error.errorDescription)
            }
        }
    }
}
