//
//  ResultViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 11/05/23.
//

import UIKit

class ResultViewController: BaseViewController {

    // MARK: View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views

    func setupViews() {
        view.backgroundColor = .yellow
    }
    
    // MARK: deinit
    deinit {
        print("Deinit called \(self)")
    }

}
