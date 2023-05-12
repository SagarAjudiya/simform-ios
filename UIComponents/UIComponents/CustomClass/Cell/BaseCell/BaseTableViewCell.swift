//
//  BaseTableViewCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 16/05/23.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    // MARK: Cell Identifier
    class var cellIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: Cell lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    deinit {
        print("Denit call \(self)")
    }

}
