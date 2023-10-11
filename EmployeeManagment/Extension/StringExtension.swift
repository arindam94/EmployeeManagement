//
//  StringExtension.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import Foundation

//MARK: Extension for localized string
extension String{
    var localized: String{
        NSLocalizedString(self, comment: self)
    }
}
