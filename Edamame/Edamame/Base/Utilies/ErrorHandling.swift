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
    case invalid(reason: PasswordErrorReason)

    var localizedDescription: String {
        switch self {
        case .empty:
            return "Password is required"
        case .invalid(let reason):
            return reason.rawValue
        }
    }
}

enum PasswordErrorReason: String {
    case length = "Password's length must be greater than 6 and less than 21"
    case format = "A password can only contain alphanumeric characters with underscores, hyphens, periods, at sign"
}

enum EmailErrorReason: String {
    case format = "E-mail must be a valid email address"
    case suffix = "E-mail must has suffix @gmail.com"
}
