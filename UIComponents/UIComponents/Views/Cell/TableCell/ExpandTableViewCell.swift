//
//  ExpandTableViewCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 16/05/23.
//

import UIKit

// MARK: Protocol ExpandTableViewCellDelegate
protocol ExpandTableViewCellDelegateProtocol: AnyObject {
    func btnMoreTapped(cell: ExpandTableViewCell)
}

class ExpandTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var btnSeeMore: UIButton!
    
    // MARK: - Variable
    weak var delegate: ExpandTableViewCellDelegateProtocol?
    
    /// using closure
//    var btnClicked: (() -> (Void))!

    func setExpandTableViewCellData(data: ExpandableView) {
        lblName.text = data.name
        lblText.text = data.text
        
        if data.isExpand {
            lblText.numberOfLines = 0
            btnSeeMore.setTitle(Constant.String.seeLess, for: .normal)
        } else {
            lblText.numberOfLines = 3
            btnSeeMore.setTitle(Constant.String.seeMore, for: .normal)
        }
        
    }

    // MARK: IBActions
    @IBAction func brnSeeMoreTapped(_ sender: UIButton) {
        /// using closure
//        btnClicked()
        delegate?.btnMoreTapped(cell: self)
    }
    
}


