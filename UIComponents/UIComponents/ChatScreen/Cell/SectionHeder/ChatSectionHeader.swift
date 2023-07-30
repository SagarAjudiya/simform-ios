//
//  ChatSectionHeader.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 01/06/23.
//

import UIKit

class ChatSectionHeader: UITableViewHeaderFooterView {

    // MARK: IBOutlets
    @IBOutlet weak var lblSectionTitle: UILabel!
    @IBOutlet weak var sectionMainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        sectionMainView.backgroundColor = Color.mainBackground
        lblSectionTitle.numberOfLines = 1
        lblSectionTitle.textAlignment = .center
    }
    
    func setHederTitle(title: String) {
        lblSectionTitle.text = title
    }
    
}
