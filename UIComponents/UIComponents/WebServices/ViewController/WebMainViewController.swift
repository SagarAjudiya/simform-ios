//
//  WebMainViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 27/06/23.
//

import UIKit

class WebMainViewController: BaseViewController, Storyboarded {
    
    // MARK: Variables
    var coordinator : MainScreenCoordinatoor?
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        
    }
    
    // MARK: IBActions
    @IBAction func btnNextTapped(_ sender: UIButton) {
        Utility.changeVC(self, "News", NewsViewController.identifier)
    }
    
    @IBAction func btnDownload(_ sender: UIButton) {
        Utility.changeVC(self, "News", MethodsViewController.identifier)
    }
    
    @IBAction func btnUploadAF(_ sender: UIButton) {
        Utility.changeVC(self, "News", UploadAFViewController.identifier)
    }
    
}


