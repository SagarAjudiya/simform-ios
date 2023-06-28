//
//  MainScreenCoordinatoor.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation
import UIKit

class MainScreenCoordinatoor: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainVC = MainScreenViewController.instantiate(from: .main)
        mainVC.coordinator = self
        navigationController.viewControllers = [mainVC]
    }
    
    func finish() {
        
    }
    
    func finishToRootView() {
        
    }
    
    func goToWebMainScreen() {
        let webMainCoordinator = WebMainCoordinator(navigationController: navigationController)
        webMainCoordinator.start()
    }
    
}
