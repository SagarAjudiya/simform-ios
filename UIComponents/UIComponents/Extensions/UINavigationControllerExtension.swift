//
//  UINavigationControllerExtension.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/05/23.
//

import UIKit

extension UINavigationController {
    
  func popSpecificViewController(ofClass: AnyClass, animated: Bool = true) {
    if let popedVC = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(popedVC, animated: animated)
    }
  }
    
}
