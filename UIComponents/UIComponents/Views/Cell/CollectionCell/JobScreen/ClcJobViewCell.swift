//
//  ClcJobViewCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 17/05/23.
//

import UIKit

class ClcJobViewCell: UICollectionViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblJobName: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    
    // MARK: View Controller lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    // MARK: SetUp Views
    private func setupViews() {
        viewContainer.setCornerRadius(radius: 24)
        viewContainer.backgroundColor = Color.jWhite
    }
    
    func setJobCellData(data: JobModel.Job) {
        imgLogo.image = UIImage(named: data.imgLogo)
        lblJobName.text = data.jobName
        lblCompany.text = data.company
        lblSalary.text = data.salary
    }
}
