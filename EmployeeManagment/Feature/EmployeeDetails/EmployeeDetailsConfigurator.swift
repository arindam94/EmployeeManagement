//
//  EmployeeDetailsConfigurator.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 10/10/23.
//

import Foundation
import UIKit

struct EmployeeDetailsConfigurator {
    private let employeeDetails: EmployeeInfo?
    
    init(employeeDetails: EmployeeInfo) {
        self.employeeDetails = employeeDetails
    }
}

extension EmployeeDetailsConfigurator: Configurator {
    func configureViewController() -> UIViewController {
        let viewController: EmployeeDetailsViewController = UIStoryboard.instantiate(identifier: .employeeDetails)
        let router = EmployeeDetailsRouter(viewController: viewController)
        let  presenter =  EmployeeDetailsPresenter(router: router, view: viewController, employeeDetails: employeeDetails!)
        let interactor = EmployeeDetailsInteractor(presenter: presenter)
        viewController.interactor = interactor
        return viewController
    }
}
