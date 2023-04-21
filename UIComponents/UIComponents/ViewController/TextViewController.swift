//
//  TextViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/04/23.
//

import UIKit

class TextViewController: BaseViewController {

    // MARK: IBOutlets
    
    @IBOutlet private weak var tvOutlet: UITextView!
    @IBOutlet private weak var tvHeight: NSLayoutConstraint!
    @IBOutlet private weak var switchIsOn: UISwitch!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var lblSliderValue: UILabel!
    @IBOutlet private weak var viewSwitchState: UIView!
    @IBOutlet private weak var switchInView: UISwitch!
    @IBOutlet private weak var lblInView: UILabel!
    
    // MARK: View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
    }
    
    // MARK: SetUp Views

    private func setupViews() {
        
        // Dyanmic Height TV
        textViewDidChange(tvOutlet)
        
        // Add done button on KeyBoard
        tvOutlet.addToolbar()
        
        // switch setup
        switchIsOn.setOn(true, animated: true)
        
        // progressbar setup
        progressView.setProgress(1.0, animated: true)
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: 1.5)

        // switch state in view
        swithOnOff()
    }
    
    // Touch outside TV focus change
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupTextView() {
        self.tvOutlet.text = Constant.String.placeHolderTxt
        self.tvOutlet.textColor = .lightGray
    }
    
    // switch inside view with label
    private func swithOnOff() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewSwitchState.addGestureRecognizer(tap)
        viewSwitchState.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        switchInView.isOn.toggle()
        lblInView.text = switchInView.isOn ? "Switch is On" : "Switch is Off"
        print(switchInView.isOn)
    }
    
    // MARK: IBActions
    
    @IBAction func switchClick(_ sender: UISwitch) {
        print(sender.isOn)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print("Slider value: \(sender.value)")
        lblSliderValue.text = "Slider Value is:- \(Int(sender.value))"
    }
    
}

// MARK: Extension TextViewController

extension TextViewController: UITextViewDelegate {
    
    // MARK: TextView Delegate
        
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print(#function)
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print(#function)
        
        // Remove PlaceHolder When text is present
        if(textView.text == Constant.String.placeHolderTxt && textView.textColor == .lightGray) {
            textView.text = ""
            textView.textColor = .black
        }
        textView.becomeFirstResponder()
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print(#function)
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print(#function)
        
        // PlaceHolder when TextView is empty
        if(textView.text == "") {
            textView.text = Constant.String.placeHolderTxt
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        // change textView Height Dynamically
        tvHeight.constant = tvOutlet.contentSize.height
    }
    
}


