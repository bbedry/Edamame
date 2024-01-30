//
//  FirebaseManager.swift
//  Edamame
//
//  Created by Bedri Doğan on 27.01.2024.
//

import Foundation
import FirebaseAuth
import SendGrid

class FirebaseManager {
    static let shared = FirebaseManager()

    init() {}
    
    var sendGridURL: URL {
        return URL(string: "https://api.sendgrid.com/v3/mail/send")!
    }
    
    var sendGridApiKey: String {

        return "PERSONAL API KEY HERE"
    }
    var otpCode: String {
        return generateOTP()
    }
    
    
    func signUp(email: String, password: String, completion: @escaping (Result<User?, Error>) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(authResult?.user))
            }
        }
    }

    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Sign-in successful!"))
            }
        }
    }
    
    func sendVerification() {
        
        let json:[String:Any] = [
            "personalizations":[["to": [["email": "bedridogn@gmail.com"]]]],
              "from": ["email": "beddoan@gmail.com"],
              "subject": "Sending with SendGrid is Fun",
              "content": [["type":"text/plain", "value":"\(otpCode)"]]
          ]
        
        let data = try? JSONSerialization.data(withJSONObject: json, options: [])
        
        
        var request = URLRequest(url: sendGridURL)
        
        request.httpMethod = "POST"
        request.addValue("Bearer \(sendGridApiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = data
        
       
     
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            }
            if let data = data {
                print(data)
            }
            
            
            if let response = response as? HTTPURLResponse {
                print("status code: \(response.statusCode)")
            }
        }.resume()
    }

}

extension FirebaseManager {
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
