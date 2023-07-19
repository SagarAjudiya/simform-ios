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
    }
    
    // MARK: IBActions
    @IBAction func btnNextTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.news.name, NewsViewController.identifier)
    }
    
    @IBAction func btnDownload(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.news.name, MethodsViewController.identifier)
    }
    
    @IBAction func btnUploadAF(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.news.name, UploadAFViewController.identifier)
    }
    
}


