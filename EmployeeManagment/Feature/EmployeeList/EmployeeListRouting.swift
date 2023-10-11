//
//  EmployeeListRouting.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation
import UIKit
protocol EmployeeListRouting{
    func showEmployeeDetails(employeeData: EmployeeInfo)
}


struct EmployeeRouter{
    
    private var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}

extension EmployeeRouter: EmployeeListRouting{
    func showEmployeeDetails(employeeData: EmployeeInfo) {
        let configurator = EmployeeDetailsConfigurator(employeeDetails: employeeData)
        let employeeDetailsVc = configurator.configureViewController()
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(employeeDetailsVc, animated: true)
        }
    }
}
