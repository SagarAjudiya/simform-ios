//
//  TableHeader.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 23/05/23.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {
    
    // MARK: IBOutlets
    @IBOutlet weak var lblheaderTitle: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    private func setupViews() {
        btnSeeAll.configuration?.baseForegroundColor = Color.jGrey
    }
    
    func setHeaderTitle(title: String) {
        lblheaderTitle.text = title
    }
}
