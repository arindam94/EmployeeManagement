//
//  EmployeeService.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import Foundation
import Combine
protocol EmployeeServiceProvider{
    func fetchEmployeeData() async throws -> EmployeeData?
}


final class EmployeeService: EmployeeServiceProvider{
    private let httpClient: HttpsClientInterface
    private var cancellables: [AnyCancellable] = []
    
    func fetchEmployeeData() async throws -> EmployeeData? {
        let request = NetworkRequest<EmployeeData>.employeeDataRequest()
        return try await withCheckedThrowingContinuation { continuation in
            httpClient.loadData(networkRequest: request).sink { completion in
                switch completion{
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .finished: break
                    
                }
            } receiveValue: { dateValue in
                continuation.resume(returning: dateValue)
            }
            .store(in: &cancellables)

        }
    }
    
    init(httpClient: HttpsClientInterface) {
        self.httpClient = httpClient
    }
    
  
    
}

