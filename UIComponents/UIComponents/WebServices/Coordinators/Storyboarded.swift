//
//  Storyboarded.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation
import UIKit

// MARK: enum
enum Storyboard: String {
    
    case main = "Main"
    case webMain = "WebMain"
    case news = "News"
    
}

// MARK: protocol
protocol Storyboarded {
    static func instantiate(from storyboard: Storyboard) -> Self
}

// MARK: Extension Storyboarded
extension Storyboarded where Self: UIViewController {
    
    static func instantiate(from storyboard: Storyboard) -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
}
