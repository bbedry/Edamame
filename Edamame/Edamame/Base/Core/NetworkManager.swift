//
//  NetworkManager.swift
//  Edamame
//
//  Created by Bedri Doğan on 29.01.2024.
//

import Foundation
import Alamofire

final class NetworkManager {
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    func request<T: Codable>(_ router: URLRequestConvertible,
                                decodeToType type: T.Type,
                                completionHandler: @escaping (Result<T, NetworkError>) -> ()) {
          AF.request(router).responseData { response in
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
                  completionHandler(.failure(.networkError(error)))
              }
          }
      }
}
enum NetworkError: Error {
    case decodeError(Error)
    case networkError(Error)
}
