//
//  NewsDetailsViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 03/07/23.
//

import UIKit

class NewsDetailsViewController: BaseViewController {
    
    // MARK: Variables
    var article: Article?
    
    // MARK: Outlets
    @IBOutlet weak private var imgNews: UIImageView!
    @IBOutlet weak private var lblAuthor: UILabel!
    @IBOutlet weak private var lblTitle: UILabel!
    @IBOutlet weak private var lblDesc: UILabel!
    @IBOutlet weak private var lblContent: UILabel!
    @IBOutlet weak private var lblPublishedAt: UILabel!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: Setup Views
    private func setUpViews() {
        imgNews.setCornerRadius(radius: 20)
        imgNews.contentMode = .scaleAspectFill

        guard let article else { return }
        lblAuthor.text = "Author: \(article.author ?? "")"
        lblTitle.text = "\(article.title)"
        lblDesc.text = "\(article.description)"
        
        let imgUrl = URL(string: article.urlToImage ?? "")
        imgNews.kf.setImage(with: imgUrl, placeholder: UIImage(named: "swift"))
        
        lblPublishedAt.text = "PublishedAt: \(String(article.publishedAt.prefix(10)))"
        lblContent.text = article.content
    }

}
