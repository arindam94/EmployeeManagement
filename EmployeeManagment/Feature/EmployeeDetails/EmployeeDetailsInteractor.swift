//
//  EmployeeInteractor.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 10/10/23.
//

import Foundation

// Known: For future use. keeping empty
protocol EmployeeDetailsInteractorInterface {
    func  showEmployeeData()
}

struct EmployeeDetailsInteractor {
    private let presenter: EmployeeDetailsPresenterInterface
    init(presenter: EmployeeDetailsPresenterInterface) {
        self.presenter = presenter
    }
}

//MARK: Interface Implementation
extension EmployeeDetailsInteractor: EmployeeDetailsInteractorInterface {
    func showEmployeeData() {
        presenter.updateEmployeeDetails()
    }
}
