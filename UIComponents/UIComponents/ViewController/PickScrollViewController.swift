//
//  PickScrollViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 25/05/23.
//

import UIKit

class PickScrollViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var txtShowPickerData: UITextField!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        
        txtShowPickerData.delegate = self
        txtShowPickerData.inputView = pickerView
    }

}

// MARK: Extension PickScrollViewController
extension PickScrollViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        PickDateMonth.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch PickDateMonth(rawValue: component) {
        case .date:
            return PickerModel.date.count
        case .month:
            return PickerModel.month.count
        case .none:
            return .zero
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch PickDateMonth(rawValue: component) {
        case .date:
            return PickerModel.date[row]
        case .month:
            return PickerModel.month[row]
        case .none:
            return PickerModel.date[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch PickDateMonth(rawValue: component) {
        case .date:
            txtShowPickerData.text = PickerModel.date[row]
        case .month:
            txtShowPickerData.text = PickerModel.month[row]
        case .none:
            txtShowPickerData.text = PickerModel.date[row]
        }
    }
    
}

// MARK: Extension PickScrollViewController
extension PickScrollViewController: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        pickerView.isHidden = false
        return false
    }

}
