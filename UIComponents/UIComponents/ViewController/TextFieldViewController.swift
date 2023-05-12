//
//  TextFieldViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 27/04/23.
//

import UIKit

class TextFieldViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var tfUsername: UITextField!
    @IBOutlet private weak var tfEmail: UITextField!
    @IBOutlet private weak var tfPhone: UITextField!
    @IBOutlet private weak var tfPassword: UITextField!
    @IBOutlet private weak var btnSubmit: UIButton!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        
        // delegate of textfields
        tfPhone.delegate = self
        tfPassword.delegate = self
        
        // set image for fields
        tfUsername.setLeftImageTF(padding: 20, imageName: "user")
        tfEmail.setLeftImageTF(padding: 20, imageName: "email")
        tfPhone.setLeftImageTF(padding: 20, imageName: "phone")
        tfPassword.setLeftImageTF(padding: 20, imageName: "password")
        
        tfPassword.setRightImageTF(padding: 30, imageName: "eye")
        tfPassword.setRightBtn(textField: tfPassword)

        // placeholder color change
        tfUsername.attributedPlaceholder = NSAttributedString(
            string: "Placeholder Text",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        
        // open keyboard in this field
        tfUsername.becomeFirstResponder()
    }
    
    // dissmiss keyboard outside view touch
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: IBActions
    @IBAction func emailValidation(_ sender: UITextField) {
        let isValidEmail = Validator.shared.isEmailValid(email: sender.text)
        if isValidEmail {
            sender.setBorderColor(color: .clear)
        } else {
            sender.setBorderColor(color: .red)
        }
    }
    
    @IBAction func btnSubmitClick(_ sender: UIButton) {
        Validator.shared.validation(textFields: tfUsername, tfEmail, tfPhone, tfPassword)
        
        print("Username: ", tfUsername.text ?? "")
        print("Email: ", tfEmail.text ?? "")
        print("Phone: ", tfPhone.text ?? "")
        print("Password: ", tfPassword.text ?? "")
    }
    
}

// MARK: Extension TextFieldViewController
extension TextFieldViewController: UITextFieldDelegate {
    
    // MARK: TextField Delegate
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function, range.location)
        if textField == tfPhone {
            if textField.text?.count ?? 0 < 10 {
                return true
            } else {
                print("Max length is 10")
                return false
            }
        } else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.nextTextField(textField)
        
        if textField == tfPassword {
            btnSubmitClick(btnSubmit)
        }
        return true
    }
    
}
