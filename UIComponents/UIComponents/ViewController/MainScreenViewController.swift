//
//  MainScreenViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 15/05/23.
//

import UIKit

class MainScreenViewController: BaseViewController, Storyboarded {

    // MARK: Variables
    var coordinator: MainScreenCoordinatoor?
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
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
        Utility.changeVC(self, "ScrollView", "ScrollView")
    }
    
    @IBAction func btnTabBarProTapped(_ sender: UIButton) {
        Utility.changeVC(self, "TabBar", "TabMainViewController")
    }

    @IBAction func btnTabBarTapped(_ sender: UIButton) {
        Utility.changeVC(self, "TabBar", "TabBar")
    }

    @IBAction func btnPickerView(_ sender: UIButton) {
        Utility.changeVC(self, "PickerView", "PickerView")
    }
    
    @IBAction func btnMapViewTapped(_ sender: UIButton) {
        Utility.changeVC(self, "MapView", "MapView")
    }
    
    @IBAction func btnNavigationTapped(_ sender: UIButton) {
        Utility.changeVC(self, "Navigation", "Navigation")
    }
    
    @IBAction func btnChatScreenTapped(_ sender: UIButton) {
        Utility.changeVC(self, "Chat", "ChatViewController")
    }
    
    @IBAction func btnWebServiceTapped(_ sender: UIButton) {
        Utility.changeVC(self, "WebMain", WebMainViewController.identifier)
    }
    
}
