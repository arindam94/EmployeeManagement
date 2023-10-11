//
//  EmployeeDetailsRouting.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 10/10/23.
//

import Foundation
import UIKit


struct EmployeeDetailsRouter {
    private weak var viewController: UIViewController?
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}
