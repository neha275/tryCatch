//
//  ValidationViewModel.swift
//  trycatch
//
//  Created by Neha on 29/1/2023.
//

import Foundation

enum PasswordError: Error {
    case passwordShort
    case specialCharaterRequired
    case numericRequired
}

class ValidationViewModel {
    init() {
        
    }
    func validatePassword(password: String) throws {
        if password.count < 8 {
            throw PasswordError.passwordShort
        }
        let numberRegEx  = ".*[0-9]+.*"
        let numbertest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        if !numbertest.evaluate(with: password) {
            throw PasswordError.numericRequired
        }
        let regex = try! NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options())
        if !(regex.firstMatch(in: password, options: NSRegularExpression.MatchingOptions(), range:NSMakeRange(0, password.count)) != nil) {
            throw PasswordError.specialCharaterRequired
        }
        print("Password is strong")
    }
}
