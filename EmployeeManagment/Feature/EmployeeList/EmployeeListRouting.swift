//
//  EmployeeListRouting.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 08/10/23.
//

import Foundation
import UIKit
protocol EmployeeListRouting{
    func showEmployeeDetails(employeeDate: [EmployeeData])
}


struct EmployeeRouter{
    
    private var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}

extension EmployeeRouter: EmployeeListRouting{
    func showEmployeeDetails(employeeDate: [EmployeeData]) {
        let service = EmployeeService(httpClient: HTTPClient.callHTTPClient())
      //  let  configurator = EmployeeConfigurator(service: service, dataStore: <#T##Dataprovider#>)
    }
    
    
}
