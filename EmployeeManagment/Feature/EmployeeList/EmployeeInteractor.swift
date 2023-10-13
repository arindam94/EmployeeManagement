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
    private let presenter: EmployeePresenterInterface
    private let dataStore: Dataprovider

    init(service: EmployeeService, presenter: EmployeePresenterInterface, dataStore: Dataprovider) {
        self.service = service
        self.presenter = presenter
        self.dataStore = dataStore
    }
}

extension EmployeeInteractor: EmployeeListInteractor {
    func showEmployeeDetails(index: Int) {
        if let employeeInfo = dataStore.employeeDataAt(index: index) {
            presenter.showEmployeeDetails(info: employeeInfo)
        }
    }

    func getListofEmployee() {
        Task {
            do {
                if  let listData =  try await service.fetchEmployeeData() {
                    dataStore.addEmployeedata(dataValue: listData)
                    presenter.employeeListUpdate(list: listData)
                }
            } catch let error as ResponseError {
                presenter.employeeRequestFailed(description: error.errorDescription)
            }
        }
    }
}
