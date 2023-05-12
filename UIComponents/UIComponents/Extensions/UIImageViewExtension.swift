//
//  UIImageViewExtension.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 10/05/23.
//

import UIKit

extension UIImageView {
 
    // MARK: Circle Image
    func makeRoundImage() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
    
    // MARK: Make Blur Image
    func addBlur(_ alpha: CGFloat = 0.5) {
        let blurEffect = UIBlurEffect(style: .systemMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.alpha = alpha
        self.addSubview(blurView)
    }
    
}
