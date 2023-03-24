//
//  CustomView.swift
//  DelegateExample
//
//  Created by Sagar Ajudiya on 24/03/23.
//

import Foundation
import UIKit

class CustomView: UIView {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    weak var delegate: TextTransferDelegate?
    
    @IBAction func changeTextPressed(_ sender:UIButton) {
        guard let delegate = delegate else { return }
        delegate.transferText(text: textField.text!)
    }
        
}

protocol TextTransferDelegate: AnyObject {
    func transferText(text: String)
}

