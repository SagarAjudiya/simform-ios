//
//  Gredient.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 08/05/23.
//

import Foundation
import UIKit

extension UIView {
    
    /// All @IBInspectable is for learning purpose..
    
//    // MARK: Corner Radius
//    @IBInspectable var cornerRadius: CGFloat {
//        get { return layer.cornerRadius }
//        set {
//              layer.cornerRadius = newValue
//              layer.masksToBounds = (newValue > 0)
//        }
//    }
//
//    // MARK: Shadow Radius
//    @IBInspectable var shadowRadius: CGFloat {
//        get { return layer.shadowRadius }
//        set { layer.shadowRadius = newValue }
//    }
//
//    // MARK: Shadow Color
//    @IBInspectable var shadowColor: UIColor? {
//        get {
//            guard let cgColor = layer.shadowColor else {
//                return nil
//            }
//            return UIColor(cgColor: cgColor)
//        }
//        set { layer.shadowColor = newValue?.cgColor }
//    }
//
//    // MARK: Border Color
//    @IBInspectable var borderColor: UIColor? {
//        get {
//            guard let cgColor = layer.borderColor else {
//                return nil
//            }
//            return UIColor(cgColor: cgColor)
//        }
//        set { layer.borderColor = newValue?.cgColor }
//    }
//
//    // MARK: Border Width
//    @IBInspectable var borderWidth: CGFloat {
//        get {
//            return layer.borderWidth
//        }
//        set {
//            layer.borderWidth = newValue
//        }
//    }
    
    // MARK: Gredient Color
    func applyGredient(colors: [UIColor], locations: [NSNumber]? = nil) {
        let gredient: CAGradientLayer = CAGradientLayer()
        gredient.frame = self.bounds
        gredient.type = .axial
        gredient.colors = colors.map{ $0.cgColor }
        gredient.locations = locations
        gredient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gredient.endPoint = CGPoint(x: 1, y: 1)
        self.clipsToBounds = true
        self.layer.insertSublayer(gredient, at: 0)
    }
    
    // MARK: Corner Radius
    func setCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    // MARK: Shadow Radius
    func setShadowRadius(radius: CGFloat) {
        layer.shadowRadius = radius
        layer.masksToBounds = true
    }
    
    // MARK: Shadow Color
    func setShadowColor(color: UIColor) {
        layer.shadowColor = color.cgColor
    }
    
    // MARK: BorderColor
    func setBorderColor(color: UIColor) {
        layer.borderColor = color.cgColor
    }
    
    // MARK: BorderWidth
    func setBorderWidth(width: CGFloat) {
        layer.borderWidth = width
    }

    // MARK: RoundView
    func makeRoundView() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
}

extension UIView {
    
    /// For all cell identifiers
     class var identifier: String {
        return String(describing: self)
    }
    
}
