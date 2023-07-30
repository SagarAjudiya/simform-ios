//
//  FeaturedViewCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 22/05/23.
//

import UIKit

class FeaturedViewCell: UICollectionViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnAdmin: UIButton!
    @IBOutlet weak var btnFullTime: UIButton!
    @IBOutlet weak var btnJunior: UIButton!
    @IBOutlet weak var imgCompany: UIImageView!
    @IBOutlet weak var lblJobTitle: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    // MARK: View Controller lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupviews()
    }

    // MARK: - SetUp Views
    private func setupviews() {
        imgView.setCornerRadius(radius: 12)
        imgView.backgroundColor = .white
        
        containerView.setCornerRadius(radius: 24)
        containerView.backgroundColor = Color.jcardbg
        
        btnAdmin.setCornerRadius(radius: 12)
        btnFullTime.setCornerRadius(radius: 12)
        btnJunior.setCornerRadius(radius: 12)
    }
    
    func setCellData(data: JobModel.Job) {
        imgCompany.image = UIImage(named: data.imgLogo)
        lblJobTitle.text = data.jobName
        lblCompanyName.text = data.company
        lblSalary.text = data.salary
        lblLocation.text = data.location
    }
    
}
