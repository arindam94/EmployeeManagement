//
//  EmployeePresenter.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 10/10/23.
//

import Foundation


protocol EmployeeDetailsPresenterInterface{
    func updateEmployeeDetails()
}

struct EmployeeDetailsPresenter{
    private  var router: EmployeeDetailsRouter
    private weak var view: EmployeeDetailsViewInterface?
    private var employeeDetails: EmployeeInfo
    
    init(router: EmployeeDetailsRouter, view: EmployeeDetailsViewInterface?, employeeDetails: EmployeeInfo) {
        self.router = router
        self.view = view
        self.employeeDetails = employeeDetails
    }

}

extension EmployeeDetailsPresenter: EmployeeDetailsPresenterInterface{
    func updateEmployeeDetails() {
        view?.showEmployeeDetails(info: employeeDetails)
    }
}
