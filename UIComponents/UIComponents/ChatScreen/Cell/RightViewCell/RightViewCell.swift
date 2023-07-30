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
    @IBOutlet weak var imgSenderProfile: UIImageView!
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
    
    // MARK: Set Data in cell
    func setRightCellData(chat: ChatModel) {
        let date = Utility.unixTimestampToDate(timestamp: chat.time)
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        
        imgSenderProfile.image = chat.image
        lblChatSender.text = chat.textMessage.getMessage() as? String
        lblTimeSender.text = ("\(hour):\(minute)")
    }
    
}
