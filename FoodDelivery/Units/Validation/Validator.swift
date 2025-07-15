//
//  Validator.swift
//  FoodDelivery
//
//  Created by Hassan Sayed on 15/07/2025.
//

import UIKit

let VALID = Validator.shared

struct ValidationRegEx {
    
    static let email = "(^[_A-Za-z0-9-+]{2,}(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]{2,}(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,4})$)"
    static let phone = "^[+]?[0-9.-٩]{7,18}$"
    static let number = ".*[0-9]+.*"
    static let date = #"^\d{1,2}[\/-]\d{1,2}[\/-]\d{4}$"#
}

class Validator: NSObject {
    
    static var shared = Validator()
    
    func isNotEmpty(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count > 0
    }
    
    func isName(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count > 2
    }
    
    func isEmail(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.email)
    }
    
    func isPhone(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.phone)
    }
    
    func isPhone(_ text: String?, _ count: Int) -> Bool {
        return validate(text, ValidationRegEx.phone) && text!.trimmingCharacters(in: .whitespaces).count == count
    }
    
    func isPassword(_ text: String?) -> Bool {
        return text != nil && text!.trimmingCharacters(in: .whitespaces).count > 5
    }
        
    func isCardNumber(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.number) && text!.trimmingCharacters(in: .whitespaces).count == 16
    }

    func isCVV(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.number) && text!.trimmingCharacters(in: .whitespaces).count == 3
    }
    
    func isDate(_ text: String?) -> Bool {
        return validate(text, ValidationRegEx.date)
    }
    
    func validate(_ text: String?, _ regEx: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regEx)
        return test.evaluate(with: text)
    }
}
