//
//  MockProvider.swift
//  EmployeeManagmentTests
//
//  Created by Arindam Santra on 09/10/23.
//

import XCTest
@testable import EmployeeManagment

final class MockDataProvider {
    static func getEmployeeData() -> EmployeeData? {
        guard let data = try?  TestUtils.dataValue(fromResource: "EmployeeDataRespone", ext: "json") else {return nil }
        debugPrint("data from json filer is - \(String(decoding: data, as: UTF8.self))")
        do{
            let employeeData = try JSONDecoder().decode(EmployeeData.self, from: data)
            return employeeData
        }
        catch let error{
            debugPrint("error after decoding failed is -    \(error)")
            return nil
        }
    }
}
