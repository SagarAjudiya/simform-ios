//
//  AppCoordinator.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if UserDefaultHelper.isLogedIn {
            goToHome()
        } else {
            goToLogin()
        }
    }
    
    func goToLogin() {
        let mainScreenCoordinator = MainScreenCoordinatoor(navigationController: navigationController)
        mainScreenCoordinator.start()
    }
    
    func goToSignUp() {
    }
    
    func goToHome() {
    }
    
    func finish() {
    }
    
    func finishToRootView() {
    }
    
}
