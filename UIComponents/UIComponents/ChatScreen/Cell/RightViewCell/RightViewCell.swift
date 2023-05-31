//
//  RightViewCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 31/05/23.
//

import UIKit

class RightViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var mainRightView: UIView!
    @IBOutlet weak var imgSender: UIImageView!
    @IBOutlet weak var lblChatSender: UILabel!
    @IBOutlet weak var lblTimeSender: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    // MARK: SetUp Views
    private func setupViews() {
        
    }
    
    func setRightCellData(chat: ChatModel) {
        imgSender.image = chat.image
        lblChatSender.text = chat.text
        lblTimeSender.text = String(chat.time)
    }
    
}
