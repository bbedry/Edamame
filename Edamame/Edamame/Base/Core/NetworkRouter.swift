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
        return "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"
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
            return ["Bearer": "\(sendGridApiKey)"]
        }
    }
    
    var parameters: [String: Any] {
        switch self {
            
        case .sendVerificationCode(let email):
           
            [
                "personalizations":[["to": [["email": "bedridogn@gmail.com"]]]],
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
        if let headers = headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
                urlRequest.setValue("application/json", forHTTPHeaderField: "Authorization")
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//                urlRequest.addValue(<#T##value: String##String#>, forHTTPHeaderField: <#T##String#>)
            }
        } else {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        let encoding: ParameterEncoding = (method == .post) ? URLEncoding.default : URLEncoding.default
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
