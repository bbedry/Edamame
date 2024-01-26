//
//  StringExtension.swift
//  Edamame
//
//  Created by Bedri Doğan on 26.01.2024.
//

import Foundation


extension String {

    var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    func validateRegex(_ regex: Regex) -> Bool {
        let pre = NSPredicate(format: "SELF MATCHES %@", regex.rawValue)
        return pre.evaluate(with: self)
    }
    
}
