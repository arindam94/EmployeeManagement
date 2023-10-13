//
//  EmployeeListRouting.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation
import UIKit

// MARK: - EmployeeList Protocol
protocol EmployeeListRouting {
    func showEmployeeDetails(employeeData: EmployeeInfo)
}

struct EmployeeRouter {
    private var viewController: UIViewController?
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}

// MARK: - EmployeeList Implementation, on implementation it will route to EmployeeDetails Screen
extension EmployeeRouter: EmployeeListRouting {
    func showEmployeeDetails(employeeData: EmployeeInfo) {
        let configurator = EmployeeDetailsConfigurator(employeeDetails: employeeData)
        let employeeDetailsVc = configurator.configureViewController()
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(employeeDetailsVc, animated: true)
        }
    }
}
