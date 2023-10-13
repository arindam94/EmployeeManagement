//
//  StringExtension.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import Foundation

// MARK: Extension for localized string
extension String {
    var localized: String {
        NSLocalizedString(self, comment: self)
    }

    static func getCompleteName(employeeDetails: EmployeeInfo) -> String {
        var completeName: String = ""
        completeName += "\(employeeDetails.firstName ?? "")"
        completeName += " \(employeeDetails.maidenName ?? "")"
        completeName += " \(employeeDetails.lastName ?? "")"
        return completeName
    }
}
