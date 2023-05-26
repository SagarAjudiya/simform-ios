//
//  UITextField.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 09/05/23.
//

import Foundation
import UIKit

extension UITextField {
    
    // MARK: Set Left Padding
    func setLeftPaddingTF(padding: Double) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.leftView = leftView
        self.leftViewMode = .always
        
    }
    
    // MARK: Set Left Image
    func setLeftImageTF(padding: Double, imageName: String) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        let imageView =  UIImageView(frame: CGRect(x: 5, y: 5, width: padding - 10, height: self.frame.size.height - 10.0))
        imageView.image = UIImage(named: imageName)
       
        leftView.addSubview(imageView)
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    // MARK: Set Right Padding
    func setRightPaddingTF(padding: Double) {
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        self.rightView = rightView
        self.rightViewMode = .always
    }
    
    // MARK: Set Right Image
    func setRightImageTF(padding: Double, imageName: String) {
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.size.height))
        let imageView =  UIImageView(frame: CGRect(x: 5, y: 5, width: padding - 10, height: self.frame.size.height - 10.0))
        imageView.image = UIImage(named: imageName)
       
        rightView.addSubview(imageView)
        self.rightView = rightView
        self.rightViewMode = .always
    }
    
    // MARK: Set Right Button
    func setRightBtn(textField: UITextField) {
        let button = UIButton(frame: CGRect(x: 5, y: 5, width: 20, height: textField.frame.size.height - 10.0))
        button.setImage(UIImage(named: "eye"), for: .normal)
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: textField.frame.size.height))
        rightView.addSubview(button)
        textField.rightView = rightView
        textField.rightViewMode = .always
        button.addTarget(self, action: #selector(clickPasswordImage), for: .touchUpInside)
    }
    
    // Click Password Button
    @objc private func clickPasswordImage(_ sender: UIButton) {
        if self.isSecureTextEntry {
            sender.setImage(UIImage(named: "eye"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "eyeslash"), for: .normal)
        }
        self.isSecureTextEntry = !self.isSecureTextEntry
        print(#function)
    }
    
    // MARK: Next Responder 
    func nextTextField(_ textField: UITextField) {
        let nextTextFieldTag = textField.tag + 1

        if let nextTextField = textField.superview?.viewWithTag(nextTextFieldTag) as? UITextField {
            nextTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
    }
    
}

// MARK: Extension For Open DatePicker
extension UITextField {
    
    func setDatePickerAsInputViewFor(target: Any, selector: Selector) {
        
        let datePicker = UIDatePicker()
        datePicker.sizeToFit()
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .dateAndTime
        self.inputView = datePicker
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(tapCancel))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .done, target: nil, action: selector)
        
        toolBar.setItems([cancel,flexibleSpace, done], animated: false)
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}
