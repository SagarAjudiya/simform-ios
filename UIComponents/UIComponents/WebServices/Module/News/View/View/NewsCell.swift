//
//  NewsCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/06/23.
//

import UIKit

class NewsCell: UITableViewCell {

    // MARK: Variables
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Config Cell
    func configCell(article: Article) {
        lblAuthor.text = article.author
        lblTitle.text = article.title
    }
    
}
