//
//  NewsViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 27/06/23.
//

import UIKit
import Alamofire

class NewsViewController: BaseViewController, Storyboarded {
    
    // MARK: Variables
    var coordinator: NewsCoordinator?
    var viewModel = NewsViewModel()
    var article = [Article]()

    // MARK: IBOutlets
    @IBOutlet weak private var tblNews: UITableView!
    
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
//        viewModel.getNews()        // Get using URLSession
        bindViewModel()
        viewModel.getNewsAlamofire() // Get using Alamofire
    }
    
    // MARK: Bind ViewModel
    private func bindViewModel() {
        viewModel.onAPIError = { error in
            print(error)
        }
        
        viewModel.onSuceess = { [weak self] in
            DispatchQueue.main.async {
                self?.tblNews.reloadData()
            }
        }
        viewModel.afNewsSuccess.bind({ [weak self] article in
            guard let self = self else { return }
            self.article.append(contentsOf: article ?? [Article]())
            DispatchQueue.main.async {
                self.tblNews.reloadData()
            }
        })
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: NewsDetailsViewController.identifier) as? NewsDetailsViewController else { return }
        vc.article = article[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = article.count - 1
         if indexPath.row == lastItem {
             if APIManager.shared.currentPage < APIManager.shared.totalPage {
                 APIManager.shared.currentPage += 1
                 viewModel.getNewsAlamofire()
             }
         }
    }
    
}
