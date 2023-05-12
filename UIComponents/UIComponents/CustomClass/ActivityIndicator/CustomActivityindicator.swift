//
//  CustomActivityindicator.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 08/05/23.
//

import UIKit

class CustomActivityindicator: UIActivityIndicatorView {

    // MARK: Outlets
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var customIndicator: UIActivityIndicatorView!
    
    // MARK: init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("frame")
    }
    
    convenience init(frame: CGRect, color: UIColor) {
        self.init(frame: frame)
        setupIndicator(color: color)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        print("coder")
        loadIndicatorXib(color: .red)
    }
    
    // setup indicator Programmetically
    private func setupIndicator(color: UIColor) {
        hidesWhenStopped = true
        style = .large
        self.color = color
        startAnimating()
        isUserInteractionEnabled = false
    }
    
    // Load Indicator UiView
    private func loadIndicatorXib(color: UIColor) {
        Bundle.main.loadNibNamed("ActivityIndicator", owner: self)
        self.color = color
        style = .large
        hidesWhenStopped = true
        startAnimating()
        isUserInteractionEnabled = false
    }
    
    // Hide Indicator uiView
    func hideIndicator() {
        stopAnimating()
        hidesWhenStopped = true
        isUserInteractionEnabled = false
    }
    
}
