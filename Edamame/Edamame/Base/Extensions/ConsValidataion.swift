//
//  ConsValidataion.swift
//  Edamame
//
//  Created by Bedri Doğan on 26.01.2024.
//

import Foundation

class ConsValidation {
    func getMissingValidation(str: String) -> [String] {
        var errors: [String] = []
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: str)){
            errors.append("validation_digit")
        }
        if(str.count < 6){
            errors.append("validation_min")
        }
        
        return errors
    }
}
