//
//  RedViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 05/05/23.
//

import UIKit

class RedViewController: BaseViewController {

    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        let indicator = CustomActivityindicator(frame: CGRect(x: 0, y: self.view.frame.maxY/2, width: 50, height: 50), color: .blue)
        self.view.addSubview(indicator)
        
    }
    
}
