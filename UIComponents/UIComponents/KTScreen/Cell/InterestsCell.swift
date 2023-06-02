//
//  interestsCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 02/06/23.
//

import UIKit

// MARK: Protocol
protocol InterestsCellProtocol: AnyObject {
    func selectItems(cell: InterestsCell)
}

class InterestsCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var lblInterest: UILabel!
    @IBOutlet weak var lblView: UIView!
    weak var delegate: InterestsCellProtocol?
    
    override func awakeFromNib() {
       setupViews()
    }
 
    // MARK: SetUp Views
    private func setupViews() {
        lblView.setCornerRadius(radius: 4)
        lblView.setBorderWidth(width: 1)
        lblView.setBorderColor(color: Color.signGrey)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        lblView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        delegate?.selectItems(cell: self)
    }
    
    func setCellData(data: InterestsModel) {
        lblInterest.text = data.interests
    }
    
}
