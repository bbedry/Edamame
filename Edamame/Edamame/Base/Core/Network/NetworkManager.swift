//
//  NetworkManager.swift
//  Edamame
//
//  Created by Bedri Doğan on 29.01.2024.
//

import Foundation
import Alamofire

typealias StatusCode = Result<HTTPStatusCode, NetworkError>

final class NetworkManager {
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    func request<T: Codable>(_ router: URLRequestConvertible,
                                decodeToType type: T.Type,
                                completionHandler: @escaping (Result<T, NetworkError>) -> ()) {
        
        let request = AF.request(router)
        request.validate()
        request.responseData { (response) in
            
     

            
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(type.self, from: data)
                    completionHandler(.success(result))
                } catch let error {
                    completionHandler(.failure(.decodeError(error)))
                }
            case .failure(let error):
                if let httpResponse = response.response {
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                    
                    // Check specific status codes if needed
       
                }
            }
        }
    }
}
enum NetworkError: Error {
    case decodeError(Error)
    case networkError(Error)
}

