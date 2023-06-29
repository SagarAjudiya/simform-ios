//
//  NewsViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 27/06/23.
//

import UIKit
import Alamofire

class NewsViewController: BaseViewController {
    
    // MARK: Variables
    var newsData: News?
    var article = [Article]()

    // MARK: IBOutlets
    @IBOutlet weak var tblNews: UITableView!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    // MARK: SetUp Views
    private func setupViews() {
        tblNews.delegate = self
        tblNews.dataSource = self
        tblNews.register(UINib(nibName: NewsCell.identifier, bundle: nil), forCellReuseIdentifier: NewsCell.identifier)
        getNews()
    }
    
    // Get News From URL
    private func getNews() {
        URLSessionHelper.shared.call(baseURL: .getNews, httpMethod: .get, params: nil) { (res: Result<News, Error>) in
            switch res {
            case .success(let newsData):
                self.article = newsData.articles
                DispatchQueue.main.async {
                    self.tblNews.reloadData()
                }
            case .failure(_): break
            }
        }
    }
    
}

// MARK: Extension NewsViewController
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else { return UITableViewCell() }
        
        cell.configCell(article: article[indexPath.row])
        
        return cell
    }
    
}
