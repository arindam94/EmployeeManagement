//
//  LocalizationKeys.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import Foundation

protocol  Localized {
    var localized: String {get}
}

// MARK: Application Localization keys
enum EmployeeApp: String, Localized {
    case errorDateParsingFailed
    case errorInvalidEndPoint
    case errorUnknownError
    case error
    case okTitle
    var localized: String {
        return rawValue.localized
    }
}
