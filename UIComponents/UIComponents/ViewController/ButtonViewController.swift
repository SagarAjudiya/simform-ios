//
//  ButtonViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 26/04/23.
//

import UIKit

class ButtonViewController: BaseViewController {

    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        
        // Add Button Programetically
        let myBtn = UIButton(type: .system)
        myBtn.frame = CGRect(x: 20, y: 500, width: 100, height: 50)
        myBtn.setTitle("Tap Me", for: .normal)
        myBtn.setTitle("Pressed + Hold", for: .highlighted)
        
        myBtn.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
       
       view.addSubview(myBtn)
    }
    
    // Button Action
    @objc func buttonAction(_ sender:UIButton) {
        print("Button tapped")
    }
    
    // MARK: IBAction
    
    @IBAction func btnTouch(_ sender: UIButton) {
        print("Button Touched")
    }

    @IBAction func touchUpInside(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func touchUpOutside(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func dragOutSide(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func dragInSide(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func dragExit(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func dragEnter(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func downRepeat(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func down(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func actionTriggerd(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func editingDidEnd(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func editingDidBegin(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func editingChanged(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction func didEndOnExit(_ sender: UIButton) {
        print(#function)
    }
    
}
