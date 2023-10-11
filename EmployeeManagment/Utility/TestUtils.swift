//
//  TestUtils.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 09/10/23.
//

import UIKit

final class TestUtils {
    static func dataValue(fromResource: String, ext: String) throws -> Data {
        guard let url = Bundle.main.url(forResource: fromResource, withExtension: ext) else{
            throw NSError(domain: "TEST", code: 0, userInfo: [NSLocalizedDescriptionKey: "No url found for \(fromResource). \(ext)"])
        }
        return try Data(contentsOf: url)
    }
    
    static func isUITest()-> Bool {
        return ProcessInfo.processInfo.environment.keys.contains("isUITest")
    }
}
