//
//  BaseViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 09/05/23.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: deinit
    deinit{
        print("Deinit call \(self)")
    }
    
}
