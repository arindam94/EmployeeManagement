//
//  EmployeeService.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import Foundation
import Combine

//MARK: - Employee Service protocol
protocol EmployeeServiceProvider {
    func fetchEmployeeData() async throws -> EmployeeData?
}


final class EmployeeService {
    private let httpClient: HttpsClientInterface
    private var cancellables: [AnyCancellable] = []
    
    init(httpClient: HttpsClientInterface) {
        self.httpClient = httpClient
    }
}

//MARK: - Employee Service protocol Implementation
extension EmployeeService: EmployeeServiceProvider {
    func fetchEmployeeData() async throws -> EmployeeData? {
        let request = NetworkRequest<EmployeeData>.employeeDataRequest()
        return try await withCheckedThrowingContinuation { continuation in
            httpClient.loadData(networkRequest: request).sink { completion in
                switch completion{
                case .failure(let error):
                    debugPrint(error)
                    continuation.resume(throwing: error)
                case .finished: break
                }
            } receiveValue: { dateValue in
                continuation.resume(returning: dateValue)
            }
            .store(in: &cancellables)
        }
    }
}

