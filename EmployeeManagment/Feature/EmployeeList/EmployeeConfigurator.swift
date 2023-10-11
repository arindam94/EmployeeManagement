//
//  EmployeeCinfigurator.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation
import UIKit

//MARK: ViewController Configuration Protocol
protocol Configurator {
    func configureViewController() -> UIViewController
}

struct EmployeeConfigurator {
    private let service: EmployeeService
    private let  dataStore: Dataprovider
    
    init(service: EmployeeService, dataStore: Dataprovider) {
        self.service = service
        self.dataStore = dataStore
    }
}

//MARK: Configurator Protocol Implementation
extension EmployeeConfigurator: Configurator {
    func configureViewController() -> UIViewController {
        let viewController : EmployeeListViewController = UIStoryboard.instantiate(identifier: .employeeList)
        let router = EmployeeRouter(viewController: viewController)
        let presenter = EmployeePresenter(view: viewController, router: router)
        let interactor = EmployeeInteractor(service: service, presentter: presenter, datsStore: dataStore)
        viewController.interactor = interactor
        return viewController
    }
}
