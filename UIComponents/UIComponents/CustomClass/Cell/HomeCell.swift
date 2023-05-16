//
//  HomeCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 13/05/23.
//

import UIKit

// MARK: Protocol HomeCellDelegate
protocol HomeCellDelegate: AnyObject {
    func btnApprovalDtapped(cell: HomeCell)
}

class HomeCell: BaseTableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblRequest: UILabel!
    @IBOutlet weak var lblSubmitBy: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnApproval: UIButton!
    @IBOutlet weak var viewCard: UIView!
    
    weak var delegate: HomeCellDelegate?
    
    // MARK: Cell lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCard.setCornerRadius(radius: 12)
        btnApproval.setCornerRadius(radius: 12)
        btnApproval.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        
    }
    
    // MARK: Set data in cell
    func setHomeCellData(data: Home) {
        lblId.text = data.id
        lblRequest.text = data.request
        lblSubmitBy.text = data.submitBy
        lblType.text = data.type
        lblDate.text = data.date
        
        if data.isApproved {
            btnApproval.setTitle(ApproveStatus.approved.getStatus(), for: .normal)
            btnApproval.backgroundColor = Color.appGreen
            btnApproval.tintColor = Color.appGreenBack
        } else {
            btnApproval.setTitle(ApproveStatus.awaitingApproval.getStatus(), for: .normal)
            btnApproval.backgroundColor = Color.appOrange
            btnApproval.tintColor = Color.appOrangeBack
        }
    }
    
    // MARK: IBActions
    @IBAction func btnApprovalTapped(_ sender: UIButton) {
        delegate?.btnApprovalDtapped(cell: self)
    }
    
}

