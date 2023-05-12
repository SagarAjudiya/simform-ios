//
//  TabBarViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 04/05/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
}

// MARK: Extension TabBarViewController
extension TabBarViewController: UITabBarControllerDelegate {
    
    // MARK: TabBar Delegate
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
}
