//
//  Validation.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 08/05/23.
//

import Foundation
import UIKit

class Validator {
    
    private init() { }
    
    static let shared = Validator()
    
    // MARK: Validation Of fields
    func validation(textFields: UITextField...) {
        for textField in textFields {
            if textField.text?.isEmpty ?? true {
                textField.setBorderWidth(width: 0.50)
                textField.setBorderColor(color: UIColor.red)
                textField.placeholder = "This field is mandatory"
            } else {
                textField.setBorderColor(color: UIColor.clear)
            }
        }
    }
    
    // PinCode Validation
    func isPincodeValid(pincode: String?) -> Bool {
        let postalcodeRegex = "^[0-9]{6}(-[0-9]{4})?$"
        let pincodePredicate = NSPredicate(format: "SELF MATCHES %@", postalcodeRegex)
        return pincodePredicate.evaluate(with: pincode ?? "")
    }
    
    // Email Validation
    func isEmailValid(email: String?) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email ?? "")
    }
    
    // Password Validation
    func isPasswordValid(password: String?) -> Bool {
        let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password ?? "")
    }
    
}
