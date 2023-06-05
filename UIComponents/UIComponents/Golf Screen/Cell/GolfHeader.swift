//
//  GolfHeader.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 05/06/23.
//

import UIKit

class GolfHeader: UITableViewHeaderFooterView {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var btnStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        btnStackView.setCornerRadius(radius: 12)
    }

}

