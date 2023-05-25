//
//  ViewControllerExtension.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 24/05/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    // MARK: Variable Declarations
     class var identifier: String {
        return String(describing: self)
    }
    
    // MARK: Hides Keyboard
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
                                                                 
}
