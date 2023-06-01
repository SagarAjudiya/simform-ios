//
//  LeftImageCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 01/06/23.
//

import UIKit

class LeftImageCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var mainLeftView: UIView!
    @IBOutlet weak var imgReceiverProfile: UIImageView!
    @IBOutlet weak var imgChatReceiver: UIImageView!
    @IBOutlet weak var lblTimeReceiver: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        mainLeftView.backgroundColor = Color.mainBackground
    }
    
    // MARK: Set Data in cell
    func setRightCellData(chat: ChatModel) {
        let date = Utility.unixTimestampToDate(timestamp: chat.time)
        let hour = Calendar.current.component(.hour, from: date)
        let minute = Calendar.current.component(.minute, from: date)
        
        imgReceiverProfile.image = chat.image
        imgChatReceiver.image = chat.textMessage.getMessage() as? UIImage
        lblTimeReceiver.text = ("\(hour):\(minute)")
    }
    
}
