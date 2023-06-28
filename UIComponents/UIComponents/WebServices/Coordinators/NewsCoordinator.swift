//
//  NewsCoordinator.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation
import UIKit

class NewsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let newsVC = NewsViewController.instantiate(from: .news)
        newsVC.coordinator = self
        navigationController.pushViewController(newsVC, animated: true)
    }
    
    func finish() {
    
    }
    
    func finishToRootView() {
        
    }
    

}
