//
//  NetworkRouter.swift
//  Edamame
//
//  Created by Bedri Doğan on 29.01.2024.
//

import Foundation
import Alamofire

enum NetworkRouter: URLRequestConvertible {
    case sendVerificationCode(email: String)
    
    var sendGridURL: URL {
        return URL(string: "https://api.sendgrid.com")!
    }
    
    var sendGridApiKey: String {
        return ""
    }
    var otpCode: String {
        return generateOTP()
    }
    
    var method: HTTPMethod {
        switch self {
        case .sendVerificationCode:
            return .post
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .sendVerificationCode:
            return ["Authorization": "Bearer \(sendGridApiKey)"]
        }
    }
    
    var parameters: [String: Any] {
        switch self {
            
        case .sendVerificationCode(let email):
           
            [
                "personalizations":[["to": [["email": "\(email)"]]]],
                "from": ["email": "beddoan@gmail.com"],
                "subject": "Edamame Nutrition Verification Code",
                "content":[["type":"text/plain", "value": otpCode]]
            ]
        }
    }
    
    var path: String {
        switch self {
        case .sendVerificationCode:
            return "/v3/mail/send"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = sendGridURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        let data = try? JSONSerialization.data(withJSONObject: parameters, options: [])
       
        
        if let headers = headers {
            for (key, value) in headers {
                urlRequest.httpBody = data
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.addValue("\(value)", forHTTPHeaderField: "\(key)")
                
            }
        } else {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        let encoding: ParameterEncoding = (method == .post) ? JSONEncoding.default : JSONEncoding.default
        
        return try encoding.encode(urlRequest, with: parameters)
    
    }
}

extension NetworkRouter {
    func generateOTP() -> String {
        let digit = "0123456789"
        let otpLength = 4
        var otp = ""
        
        for _ in 0..<otpLength {
            let randomIndex = Int(arc4random_uniform(UInt32(digit.count)))
            let digits = digit[digit.index(digit.startIndex, offsetBy: randomIndex)]
            otp.append(digits)
        }
        
        return otp
    }
}
