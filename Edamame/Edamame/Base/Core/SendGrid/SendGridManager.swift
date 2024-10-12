//
//  SendGridManager.swift
//  Edamame
//
//  Created by Bedri Doğan on 11.02.2024.
//

import Foundation


class SendGridManager {
    static let shared = SendGridManager()
    
    init () {}
    
    public var didSuccess: ()->() = { }
    public var didFailure: (String)->() = { _ in }
    
    var sendGridURL: URL {
        return URL(string: "https://api.sendgrid.com/v3/mail/send")!
    }
    
    var sendGridApiKey: String {

        return "SENGRID APIKEY"
    }
  
    
    
    func sendVerification(_ email: String, _ code: String) {
        
        let json:[String:Any] = [
            "personalizations":[["to": [["email": "\(email)"]]]],
              "from": ["email": "beddoan@gmail.com"],
              "subject": "Verification Code",
              "content": [["type":"text/plain", "value":"\(code)"]]
          ]
        
        
        
        if let data = try? JSONSerialization.data(withJSONObject: json, options: []) {
            var request = URLRequest(url: sendGridURL)
            
            request.httpMethod = "POST"
            request.addValue("Bearer \(sendGridApiKey)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpBody = data
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print(error)
                }
               
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                        // Do something for success
                    case HTTPStatusCode.success, HTTPStatusCode.accepted: // Handling 202 as success
                        // Do something for success
                        self.didSuccess()
                    case HTTPStatusCode.notFound:
                        // Do something for not found
                        print("Not Found!")
                        
                        
                    case HTTPStatusCode.serverError:
                        // Do something for server errors
                        print("Server Error!")
                     
                        
                    default:
                        // Handle other status codes
                        print("Unhandled Status Code: \(httpResponse.statusCode)")
                      
                    }
            
                }
            }.resume()
        } else {
            print("failed to json serialization")
        }
        
        
        
    }

}

enum HTTPStatusCode {
        static let success = 200...299
        static let accepted = 202
        static let notFound = 404
        static let serverError = 500...599
}
