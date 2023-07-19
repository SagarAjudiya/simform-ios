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
        viewModel.getNews()
        bindViewModel()
    }
    
    // MARK: Bind ViewModel
    private func bindViewModel() {
        viewModel.onAPIError = { [weak self] error in
            print(error)
        }
        
        viewModel.onSuceess = { [weak self] in
            DispatchQueue.main.async {
                self?.tblNews.reloadData()
            }
        }
    }
        
}

// MARK: Extension NewsViewController
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else { return UITableViewCell() }
        
        cell.configCell(article: viewModel.article[indexPath.row])
        return cell
    }
    
}
