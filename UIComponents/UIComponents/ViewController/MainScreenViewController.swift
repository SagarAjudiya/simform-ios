//
//  MainScreenViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 15/05/23.
//

import UIKit

class MainScreenViewController: BaseViewController {

    // MARK: IBOutlets
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
//    ScrollViewController
    
    // MARK: IBActions
    @IBAction func btnHomeScreenTapped(_ sender: UIButton) {
        Utility.changeVC(self, "HomeScreen", "HomeScreenViewController")
    }
    
    @IBAction func btnExpandTableViewTapped(_ sender: UIButton) {
        Utility.changeVC(self, "Main", "ExpandTableViewController")
    }
    
    
    @IBAction func btnCollectionViewTapped(_ sender: UIButton) {
        Utility.changeVC(self, "Main", "CollectionViewController")
    }
    
    @IBAction func btnJobScreenTapped(_ sender: UIButton) {
        Utility.changeVC(self, "JobScreen", "JobScreenViewController")
    }
    
    @IBAction func btnJobHomeScreenTapped(_ sender: UIButton) {
        Utility.changeVC(self, "JobHomeScreen", "JobHomeScreenViewController")
    }
    
    @IBAction func btnScrollViewTapped(_ sender: UIButton) {
        Utility.changeVC(self, "ScrollView", "ScrollViewController")
    }
    
}
