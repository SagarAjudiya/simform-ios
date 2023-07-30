//
//  LeftViewCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 31/05/23.
//

import UIKit

class LeftViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var mainLeftView: UIView!
    @IBOutlet weak var imgReceiverProfile: UIImageView!
    @IBOutlet weak var lblChatReciver: UILabel!
    @IBOutlet weak var lblTimeReceiver: UILabel!
    @IBOutlet weak var msgViewReceiver: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    // MARK: SetUp Views
    private func setupViews() {
        mainLeftView.backgroundColor = Color.mainBackground
        lblChatReciver.numberOfLines = 0
        msgViewReceiver.backgroundColor = Color.chatReciver
        msgViewReceiver.setCornerRadius(radius: 4)
    }
    
    // MARK: Set Data in cell
    func setLeftCellData(chat: ChatModel) {
        let date = Utility.unixTimestampToDate(timestamp: chat.time)
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        
        imgReceiverProfile.image = chat.image
        lblChatReciver.text = chat.textMessage.getMessage() as? String
        lblTimeReceiver.text = ("\(hour):\(minute)")
    }
    
}
