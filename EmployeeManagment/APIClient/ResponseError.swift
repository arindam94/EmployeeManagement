//
//  ResponseError.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import Foundation

// MARK: API respone
enum ResponseError: Error {
    case decode
    case invalidURL
    case unexpectedStatusCode

    // MARK: Localized Error Description
    var errorDescription: String {
        switch self {
        case .decode:
            return  EmployeeApp.errorDateParsingFailed.localized
        case .invalidURL:
            return  EmployeeApp.errorInvalidEndPoint.localized
        case .unexpectedStatusCode:
            return  EmployeeApp.errorUnknownError.localized
        }
    }
}
