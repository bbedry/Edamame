//
//  NetworkManagerProtocol.swift
//  Edamame
//
//  Created by Bedri Doğan on 29.01.2024.
//

import Foundation


protocol NetworkServiceProtocol {
    func sendVerificationCode(email: String, completionHandler: @escaping (Result<VerificationResponse, NetworkError>) -> ())
}

struct NetworkService: NetworkServiceProtocol {
    func sendVerificationCode(email: String, completionHandler: @escaping (Result<VerificationResponse, NetworkError>) -> ()) {
        let router = NetworkRouter.sendVerificationCode(email: email)
        NetworkManager.shared.request(router, decodeToType: VerificationResponse.self, completionHandler: completionHandler)
    }
    
    
}
