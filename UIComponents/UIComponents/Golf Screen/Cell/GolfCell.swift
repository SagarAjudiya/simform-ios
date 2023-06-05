//
//  GolfCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 05/06/23.
//

import UIKit

class GolfCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var btnMessage: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
    }
    
    func setCellData(data: GolfUser) {
        imgProfile.image = data.imgProfile
        lblName.text = data.name
        lblPhone.text = data.phone
        lblAmount.text = data.amount
        btnMessage.isSelected = data.isSelect
    }
    
}
