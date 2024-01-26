//
//  ErrorHandling.swift
//  Edamame
//
//  Created by Bedri Doğan on 26.01.2024.
//

import Foundation



// MARK: - Error definitions and reason

enum EmailError: Error {
    case empty
    case invalid(reason: EmailErrorReason)

    var localizedDescription: String {
        switch self {
        case .empty:
            return "Username is required"
        case .invalid(let reason):
            return reason.rawValue
        }
    }
}

enum PasswordError: Error {
    case empty
    case invalid(String)
    case approved
    

    var localizedDescription: String {
        switch self {
        case .empty:
            return "Password is required"
        case .approved:
            return "Approved Password"
        case .invalid(let reason):
            print("reason: \(reason)")
            
            return reason
        }
    }
}

enum PasswordErrorReason: String {
    case length = "validation_min"
    case format = "validation_digit"
}

enum EmailErrorReason: String {
    case format = "E-mail must be a valid email address"
    case suffix = "E-mail must has suffix @gmail.com"
}
