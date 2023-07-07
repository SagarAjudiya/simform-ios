//
//  UIButtonExtension.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 15/05/23.
//

import UIKit

extension UIButton {
    
    // MARK: Make round button
    func makeRoundBtn() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: Int = 8) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
    
}
