//
//  TabMainViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 25/05/23.
//

import UIKit

class TabMainViewController: UITabBarController {
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        createTabBarController()
    }
    
    // MARK: Tabbar Create
    private func createTabBarController() {
        tabBar.backgroundColor = Color.jWhite
        tabBar.tintColor = Color.jGreen
        
        /// Tabbar Corner radius
//        tabBar.setCornerRadius(radius: 30)
//        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let jobHomeScreenVC = UIStoryboard(name: Constant.StoryBoard.jobHomeScreen, bundle: nil).instantiateViewController(withIdentifier: JobHomeScreenViewController.identifier)
        let navJobHomeVC = UINavigationController(rootViewController: jobHomeScreenVC)
        jobHomeScreenVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Image.tabItem1), selectedImage: UIImage(named: Image.tabItem1))
        navJobHomeVC.isNavigationBarHidden = true
        
        let jobScreenVC = UIStoryboard(name: Constant.StoryBoard.jobScreen, bundle: nil).instantiateViewController(withIdentifier: JobScreenViewController.identifier)
        let navJobScreenVC = UINavigationController(rootViewController: jobScreenVC)
        jobScreenVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Image.tabItem2), selectedImage: UIImage(named: Image.tabItem2))
        navJobScreenVC.isNavigationBarHidden = true
        
        let homeScreenVC = UIStoryboard(name: Constant.StoryBoard.homeScreen, bundle: nil).instantiateViewController(withIdentifier: HomeScreenViewController.identifier)
        let navHomeScreenVC = UINavigationController(rootViewController: homeScreenVC)
        homeScreenVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Image.tabItem3), selectedImage: UIImage(named: Image.tabItem3))
        navHomeScreenVC.isNavigationBarHidden = true
        
        let taskVC = UIStoryboard(name: Constant.StoryBoard.task, bundle: nil).instantiateViewController(withIdentifier: TaskViewController.identifier)
        let navTaskVC = UINavigationController(rootViewController: taskVC)
        taskVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: Image.tabItem4), selectedImage: UIImage(named: Image.tabItem4))
        navTaskVC.isNavigationBarHidden = true
        
        viewControllers = [navJobHomeVC, navJobScreenVC, navHomeScreenVC, navTaskVC]
    }

}

