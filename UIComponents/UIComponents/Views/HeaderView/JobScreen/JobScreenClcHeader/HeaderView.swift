//
//  HeaderView.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 17/05/23.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    // MARK: IBOutlets
    @IBOutlet weak var lblheaderTitle: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        btnSeeAll.configuration?.baseForegroundColor = Color.jGrey
    }
    
    func setHeaderTitle(title: String) {
        lblheaderTitle.text = title
    }
    
    
}
