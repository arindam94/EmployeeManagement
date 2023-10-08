//
//  EmployeePresenter.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation

protocol EmployeePresenterInterface{
    func employeeListUpdate(list: EmployeeData)
    func employeeRequestFailed(description: String)
}

struct EmployeePresenter{
    private weak var view: EmployeeListViewInterface?
    private var router:  EmployeeListRouting
    init(view: EmployeeListViewInterface? = nil, router: EmployeeListRouting) {
        self.view = view
        self.router = router
    }
}

extension EmployeePresenter: EmployeePresenterInterface{
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
