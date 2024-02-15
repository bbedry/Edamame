//
//  Regex.swift
//  Edamame
//
//  Created by Bedri Doğan on 26.01.2024.
//

import Foundation


enum Regex: String {
    case password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}
