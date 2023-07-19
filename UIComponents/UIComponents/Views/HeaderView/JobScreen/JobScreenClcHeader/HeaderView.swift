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
    
    // MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: - SetUp Views
    private func setupViews() {
        btnSeeAll.configuration?.baseForegroundColor = Color.jGrey
    }
    
    func setHeaderTitle(title: String) {
        lblheaderTitle.text = title
    }
    
}
