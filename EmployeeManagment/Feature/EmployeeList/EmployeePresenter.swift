//
//  EmployeePresenter.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation

//MARK: Employee Presenter protocol
protocol EmployeePresenterInterface {
    func employeeListUpdate(list: EmployeeData)
    func employeeRequestFailed(description: String)
    func showEmployeeDetails(info: EmployeeInfo)
}

struct EmployeePresenter {
    private weak var view: EmployeeListViewDelegate?
    private var router:  EmployeeListRouting
    init(view: EmployeeListViewDelegate? = nil, router: EmployeeListRouting) {
        self.view = view
        self.router = router
    }
}

//MARK: Implementation of Employee Presenter protocol.
extension EmployeePresenter: EmployeePresenterInterface {
    func showEmployeeDetails(info: EmployeeInfo) {
        DispatchQueue.main.async {
            router.showEmployeeDetails(employeeData: info)
        }
    }
    
    func employeeListUpdate(list: EmployeeData) {
        DispatchQueue.main.async {
            view?.showListOfEmployee(list: list)
        }
    }
    
    func employeeRequestFailed(description: String) {
        DispatchQueue.main.async {
            view?.showError(errorMessage: description)
        }
    }
}
