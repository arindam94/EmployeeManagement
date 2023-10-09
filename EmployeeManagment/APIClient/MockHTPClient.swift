//
//  MockHTPClient.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 09/10/23.
//

import Foundation
import Combine





struct MockHTPClient: HttpsClientInterface{
    func loadData<T>(networkRequest: NetworkRequest<T>) -> AnyPublisher<T, ResponseError> where T : Decodable {
        let data = try? TestUtils.dataValue(fromResource: "EmployeeDataRespone", ext: "json")
        
        guard let data = data else{return Fail(error: ResponseError.unexpectedStatusCode).eraseToAnyPublisher()}
        guard let employeeData: T = try? JSONDecoder().decode(T.self, from: data) else{
            return Fail(error: ResponseError.unexpectedStatusCode).eraseToAnyPublisher()
        }
        return Just(employeeData).setFailureType(to: ResponseError.self).eraseToAnyPublisher()
    }
    
    
}
