//
//  EmployeeInfo.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import Foundation

struct EmployeeInfo: Codable, Hashable{
    let id: Int?
    let firstName: String?
    let lastName: String?
    let maidenName: String?
    let age: Int?
    let gender: String?
    let email: String?
    let phone: String?
    let username: String?
    let image: String?
    let company:  CompanyInfo?
}
