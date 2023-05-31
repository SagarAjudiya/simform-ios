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
    @IBOutlet weak var imgReceiver: UIImageView!
    @IBOutlet weak var lblChatReciver: UILabel!
    @IBOutlet weak var lblTimeReceiver: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    // MARK: SetUp Views
    private func setupViews() {
        
    }
    
    func setLeftCellData(chat: ChatModel) {
        imgReceiver.image = chat.image
        lblChatReciver.text = chat.text
        lblTimeReceiver.text = String(chat.time)
    }
    
}
