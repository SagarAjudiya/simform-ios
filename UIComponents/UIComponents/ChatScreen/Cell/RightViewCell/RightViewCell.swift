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
    @IBOutlet weak var msgViewSender: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    // MARK: SetUp Views
    private func setupViews() {
        mainRightView.backgroundColor = Color.mainBackground
        lblChatSender.numberOfLines = 0
        msgViewSender.backgroundColor = Color.chatSender
        msgViewSender.setCornerRadius(radius: 4)
    }
    
    func setRightCellData(chat: ChatModel) {
        imgSender.image = chat.image
        lblChatSender.text = chat.text
        lblTimeSender.text = String(chat.time)
    }
    
}
