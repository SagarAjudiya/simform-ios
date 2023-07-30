//
//  SelectInterestCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 02/06/23.
//

import UIKit

class SelectInterestCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var lblSelectInterest: UILabel!
    
    override func awakeFromNib() {
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        labelView.setCornerRadius(radius: 4)
        labelView.backgroundColor = Color.signBtnbg
    }
    
    func setCellData(data: String) {
        lblSelectInterest.text = data
    }
    
}
