//
//  TaskViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 26/04/23.
//

import UIKit

class TaskViewController: BaseViewController {

    // MARK: Outlets
    
    @IBOutlet private var btnRadio: [UIButton]!
    @IBOutlet private var btnCheckBox: [UIButton]!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: SetUp Views

    private func setupViews() {
        
        // Label Overlapping
        let lblOne = UILabel(frame: CGRect(x: 125, y: 100, width: 200, height: 20))
        lblOne.textAlignment = .center
        lblOne.text = "Label Programmatically"
        lblOne.textColor = .orange
        lblOne.isUserInteractionEnabled = true
        lblOne.font = lblOne.font.withSize(20)
        self.view.addSubview(lblOne)
        
        let lblTwo = UILabel(frame: CGRect(x: 125, y: 100, width: 200, height: 20))
        lblTwo.textAlignment = .center
        lblTwo.text = "Label Programmatically"
        lblTwo.textColor = .blue
        lblTwo.isUserInteractionEnabled = true
        lblTwo.font = lblOne.font.withSize(20)
        self.view.addSubview(lblTwo)
        
        view.bringSubviewToFront(lblOne)
        view.insertSubview(lblTwo, at: 0)
        
        // Using NSAttributed String  // -> For Reference purpose
//        let tAndC = NSMutableAttributedString(string: "Terms", attributes: [.foregroundColor: UIColor.red])
//        tAndC.append(NSAttributedString(string: " And "))
//        tAndC.append(NSAttributedString(string: "Conditions", attributes: [.foregroundColor: UIColor.green]))
        
        // Attributed String
        var tc = try? AttributedString(markdown: "Terms And Conditions")
        if let tRange = tc?.range(of: "Terms") {
            tc?[tRange].foregroundColor = .green
            tc?[tRange].underlineStyle = .single
            tc?[tRange].font = UIFont.boldSystemFont(ofSize: 30)
            
        }
        if let cRange = tc?.range(of: "Conditions") {
            tc?[cRange].foregroundColor = .red
        }
        
        // set label
        let lblTC = UILabel(frame: CGRect(x: 150, y: 150, width: 200, height: 20))
        lblTC.attributedText = NSAttributedString(tc ?? "")
        lblTC.font = lblTC.font.withSize(18)
        view.addSubview(lblTC)
        
        setButtonImage(buttons: btnRadio)
        setButtonImage(buttons: btnCheckBox)
        
        // By default selected in Radio button
        ///  avoid always use of tag
        ///  here use only for learning purpose
        for btn in btnRadio {
            if btn.tag == 3 {
                btn.isSelected = true
            }
        }
    }
    
    // Set imageicon for button
    private func setButtonImage(buttons: Array<UIButton>) {
        for btn in buttons {
            btn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
            btn.setImage(UIImage(systemName: "checkmark.rectangle"), for: .normal)
            btn.configuration?.imagePadding = 10
        }
    }
    
    // MARK: IBActions
    
    // Radio Button
    @IBAction func selectRadioBtn(_ sender: UIButton) {
        for btn in btnRadio {
            if sender == btn {
                btn.isSelected = true
                continue
            }
            btn.isSelected = false
        }
    }
    
    // Check Box
    @IBAction func selectCheckBox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
}
