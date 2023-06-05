//
//  GolfSectionHeder.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 05/06/23.
//

import UIKit

class GolfSectionHeder: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var lblGroupTitle: UILabel!
    @IBOutlet weak var btnViewScore: UIButton!
    @IBOutlet weak var btnAllSelect: UIButton!
    @IBOutlet weak var myContentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    // MARK: SetUp Views
    private func setupViews() {
        myContentView.setCornerRadius(radius: 12)
    }
    
    func setCellData(data: GolfModel) {
        lblGroupTitle.text = data.groupName
        btnViewScore.isSelected = data.viewScore
        btnAllSelect.isSelected = data.selectAll
    }
    
}
