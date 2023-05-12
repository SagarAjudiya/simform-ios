//
//  LabelViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 26/04/23.
//

import UIKit

class LabelViewController: BaseViewController {

    // MARK: IBOutlet

    @IBOutlet private weak var lblHello: UILabel!
    
    // MARK: View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    // MARK: SetUp Views
    
    private func setupViews() {
        
        // change label property programetically  // -> For Reference purpose
//        lblHello.text = "Text by Hello Simform"
//        lblHello.textAlignment = .center
//        lblHello.textColor = .orange
        
        let lblCode = UILabel(frame: CGRect(x: 125, y: 500, width: 200, height: 20))
        lblCode.textAlignment = .center
        lblCode.text = "Label Programmatically"
        lblCode.textColor = .green
        lblCode.backgroundColor = .black
        lblCode.alpha = 0.5
        lblCode.numberOfLines = 0
        lblCode.highlightedTextColor = .orange
        lblCode.isUserInteractionEnabled = true
        lblCode.font = lblCode.font.withSize(20)
        self.view.addSubview(lblCode)
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(lblClickable))
        lblCode.addGestureRecognizer(tapgesture)
    }
    
    // MARK: Label Click
    @objc func lblClickable() {
        print("Label Programmatically is clicked")
    }
    
}
