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
        Utility.changeVC(self, R.storyboard.homeScreen.name, HomeScreenViewController.identifier)
    }
    
    @IBAction func btnExpandTableViewTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.main.name, ExpandTableViewController.identifier)
    }
    
    @IBAction func btnCollectionViewTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.main.name, CollectionViewController.identifier)
    }
    
    @IBAction func btnJobScreenTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.jobScreen.name, JobScreenViewController.identifier)
    }
    
    @IBAction func btnJobHomeScreenTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.jobHomeScreen.name, JobHomeScreenViewController.identifier)
    }
    
    @IBAction func btnScrollViewTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.scrollView.name, "ScrollView")
    }
    
    @IBAction func btnTabBarProTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.tabBar.name, TabMainViewController.identifier)
    }

    @IBAction func btnTabBarTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.tabBar.name, "TabBar")
    }

    @IBAction func btnPickerView(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.pickerView.name, "PickerView")
    }
    
    @IBAction func btnMapViewTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.mapView.name, "MapView")
    }
    
    @IBAction func btnNavigationTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.navigation.name, "Navigation")
    }
    
    @IBAction func btnChatScreenTapped(_ sender: Any) {
        Utility.changeVC(self, R.storyboard.chat.name, ChatViewController.identifier)
    }
    
    @IBAction func btnWebServiceTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.webMain.name, WebMainViewController.identifier)
    }
    
    @IBAction func btnSignUpTapped(_ sender: UIButton) {
        Utility.changeVC(self, R.storyboard.signUP.name, SignUPViewController.identifier)
    }
    
}
