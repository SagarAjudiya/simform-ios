//
//  CustomTextField.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/04/23.
//

import UIKit

class CustomTextField: UITextField {
    
    // MARK: TextField padding
    @IBInspectable var textFieldPadding: CGFloat = 2.0 {
        didSet { }
    }
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    // MARK: TextField ShadowOpacity
    @IBInspectable var shadowOpacity: Float {
        get {
           return self.layer.shadowOpacity
        }
        set {
           self.layer.shadowOpacity = newValue
       }
    }
    
    // TextField padding
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0, left: textFieldPadding, bottom: 0, right: textFieldPadding)
        return bounds.inset(by: padding)
    }
    
}
