//
//  DatePickerController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 26/05/23.
//

import UIKit

class DatePickerController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lblShowDate: UILabel!
    @IBOutlet weak var txtDate: UITextField!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        datePickerProgrammatically()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        datePicker.locale = .current
        txtDate.delegate = self
    }
    
    // Formate of Date
    private func dateSelect() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .medium
        
        let date = dateFormatter.string(from: datePicker.date)
        lblShowDate.text = date
    }
    
    // MARK: IBActions
    @IBAction func dateTapped(_ sender: UIDatePicker) {
        dateSelect()
    }
    
    // Date Picker In TextField
    func datePickerProgrammatically() {
        txtDate.setDatePickerAsInputViewFor(target: self, selector: #selector(dateIsSelected))
    }
    
    @objc func dateIsSelected() {
        if let datePickerView = txtDate.inputView as? UIDatePicker {
            txtDate.text = datePickerView.date.getFormattedDate()
        }
        txtDate.resignFirstResponder()
    }
    
}

// MARK: Extension DatePickerController
extension DatePickerController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
    
}
