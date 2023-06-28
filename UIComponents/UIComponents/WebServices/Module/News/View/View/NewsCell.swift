//
//  NewsCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/06/23.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    // MARK: Variables
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblPublishedAt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgNews.setCornerRadius(radius: 20)
    }
    
    // Config Cell
    func configCell(article: Article) {
        lblAuthor.text = "Author: \(article.author ?? "")"
        lblTitle.text = "\(article.title)"
        
        let imgUrl = URL(string: article.urlToImage ?? "")
        imgNews.kf.setImage(with: imgUrl, placeholder: UIImage(resource: R.image.swift))
        
        lblPublishedAt.text = "PublishedAt: \(String(article.publishedAt.prefix(10)))"
    }
    
}
