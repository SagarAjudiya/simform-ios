//
//  TableHeader.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 23/05/23.
//

import UIKit

// MARK: Protocol TableHederProtocol
protocol TableHederProtocol: AnyObject {
    func btnSeeAllTapped()
}

class TableHeader: UITableViewHeaderFooterView {
    
    // MARK: IBOutlets
    @IBOutlet weak var lblheaderTitle: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    weak var delegate: TableHederProtocol?
    
    // MARK: SetUp Views
    private func setupViews() {
        btnSeeAll.configuration?.baseForegroundColor = Color.jGrey
    }
    
    func setHeaderTitle(title: String) {
        lblheaderTitle.text = title
    }
    
    // MARK: IBActions
    @IBAction func btnSeeAllTapped(_ sender: UIButton) {
        delegate?.btnSeeAllTapped()
    }
    
}
