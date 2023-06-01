//
//  RightImageCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 01/06/23.
//

import UIKit

class RightImageCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var mainRightView: UIView!
    @IBOutlet weak var imgSenderProfile: UIImageView!
    @IBOutlet weak var imgChatSender: UIImageView!
    @IBOutlet weak var lblTimeSender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        mainRightView.backgroundColor = Color.mainBackground
    }
    
    // MARK: Set Data in cell
    func setRightCellData(chat: ChatModel) {
        let date = Utility.unixTimestampToDate(timestamp: chat.time)
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        
        imgSenderProfile.image = chat.image
        imgChatSender.image = chat.textMessage.getMessage() as? UIImage
        lblTimeSender.text = ("\(hour):\(minute)")
    }
    
}
