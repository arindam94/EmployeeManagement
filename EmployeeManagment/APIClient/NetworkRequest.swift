//
//  NetworkRequest.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import Foundation

//Mark: Network Request

struct NetworkRequest<T: Decodable>{
    
    let url: String
    let parameters: [String: CustomStringConvertible]
    var request: URLRequest? {
        guard let url = URL(string: url) else{
            return nil
        }
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else{
            return nil
        }
        
        components.queryItems = parameters.keys.map({ (key) -> URLQueryItem in
            URLQueryItem(name: key, value: parameters[key]?.description)
        })
        
        guard let urlValue = components.url else{
            return nil
        }
        return URLRequest(url: urlValue)
    }
    
    init(url: String, parameters: [String : CustomStringConvertible] = [:]) {
        self.url = url
        self.parameters = parameters
    }
    
}

extension NetworkRequest{
    static func employeeDataRequest()-> NetworkRequest<EmployeeData>{
        let url = EmployeeAPIConstants.baseURL + EmployeeAPIConstants.userListService
        return NetworkRequest<EmployeeData>(url: url, parameters: [:])
    }
}
