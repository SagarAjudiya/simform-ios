//
//  UITextViewExtension.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 09/05/23.
//

import Foundation
import UIKit

extension UITextView {
    
    // MARK: Done And Clear Button on KeyBoard
    func addToolbar() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 40))
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(clickedDone))
        let clear = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(clickedClear))
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([clear, spaceBtn, done], animated: true)
        self.inputAccessoryView = toolbar
    }
    
    @objc func clickedDone() {
        self.endEditing(true)
    }
    
    @objc func clickedClear() {
        self.text = ""
    }
    
}
