//
//  PickChangeRowViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 26/05/23.
//

import UIKit

class PickChangeRowViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak var pickLanguages: UIPickerView!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: View Controller lifecycle
    private func setupViews() {
        pickLanguages.delegate = self
    }
    
}

// MARK: Extension
extension PickChangeRowViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        SelectLanguageType.allCases.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch SetLanguageName(rawValue: component) {
        case .selectLangType:
            return SelectLanguageType.allCases.count
        case .setLang:
            let selectedRow = pickerView.selectedRow(inComponent: 0)
            return SetLanguageName.allCases[selectedRow].rowsInComponent()
        case .none:
            return SetLanguageName.selectLangType.rowsInComponent()
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch SetLanguageName(rawValue: component) {
        case .selectLangType:
            return SelectLanguageType(rawValue: row)?.getLanguageType()
        case .setLang:
            let selectedRow = pickerView.selectedRow(inComponent: SetLanguageName.selectLangType.rawValue)
            return SetLanguageName.allCases[selectedRow].titleForRow()?[row]
        case .none:
            return SetLanguageName.selectLangType.titleForRow()?[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickLanguages.reloadComponent(SetLanguageName.setLang.rawValue)
    }
    
}
