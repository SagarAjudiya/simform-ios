//
//  NewsViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 27/06/23.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: Variables
    let url = "https://newsapi.org/v2/everything?q=apple&from=2023-06-26&to=2023-06-26&sortBy=popularity&apiKey=485e790acd814aee899bb5f0ea24482c"
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
//        getDataFromServer()
        tblNews.delegate = self
        tblNews.dataSource = self
        tblNews.register(UINib(nibName: NewsCell.identifier, bundle: nil), forCellReuseIdentifier: NewsCell.identifier)
        getNews()
    }
    
    // Get News From URL
    private func getNews() {
        URLSessionHelper.shared.call(url: url, httpMethod: .get, params: nil) { (res: Result<News, Error>) in
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
    
    // Get Data Using JSONSerialization
    private func getDataFromServer() {
        if let url = URL(string: url) {
            let urlRequest = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
                guard let responseData = data else { return }
                print("data: \(responseData)")
                
                if let urlResponse = urlResponse {
                    print("URL Response: \(urlResponse)")
                }
                
                if let error = error {
                    print("error: \(error)")
                }
                
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: responseData)
                    print("jsonData: \(jsonData)")
                    
                } catch let error {
                    print("json error: \(error)")
                }
            }
            dataTask.resume()
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
