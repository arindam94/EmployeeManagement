//
//  HTTPClient.swift
//  EmployeeManagment
//
//  Created by Arindam Santra on 06/10/23.
//

import Foundation
import Combine

protocol HttpsClientInterface{
    func loadData<T: Decodable>(networkRequest: NetworkRequest<T>) -> AnyPublisher<T, ResponseError>
}

struct HTTPClient{
    static func callHTTPClient()-> HttpsClientInterface{
        return HTTPClient()
    }
}


extension HTTPClient: HttpsClientInterface{
    
    
    
    
    
    func loadData<T>(networkRequest: NetworkRequest<T>) -> AnyPublisher<T, ResponseError> where T : Decodable {
        guard let request = networkRequest.request else{
            return Fail(error: ResponseError.invalidURL).eraseToAnyPublisher()
        }
       
        debugPrint("Body of call is \(request.httpMethod)")
        return URLSession.shared.dataTaskPublisher(for: request)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .mapError { error in
                switch error{
                case is URLError:
                    return ResponseError.invalidURL
                case is DecodingError:
                    return ResponseError.decode
                default:
                    return ResponseError.unexpectedStatusCode

                }
            }.eraseToAnyPublisher()
    }
    
    
}
