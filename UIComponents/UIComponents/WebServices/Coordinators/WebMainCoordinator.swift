//
//  WebMainCoordinator.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation
import UIKit

class WebMainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {

    }
    
    func finish() {
        
    }
    
    func finishToRootView() {
        
    }
    
}
