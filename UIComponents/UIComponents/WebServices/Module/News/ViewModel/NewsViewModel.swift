//
//  NewsViewModel.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation

class NewsViewModel {
    
    // MARK: Variables
    var onSuceess: (() -> Void)?
    var onAPIError: ((String) -> Void)?
    var article = [Article]()
    
    var afNewsSuccess = Dynamic<[Article]?>(nil)
    var afNewsError = Dynamic<String>("")
    
    // MARK: Get News From API using URLSession
    func getNews() {
        URLSessionHelper.shared.call(baseURL: .getNews, httpMethod: .get, params: nil) { [weak self] (res: Result<News, Error>) in
            guard let self = self else { return }
            switch res {
            case .success(let newsData):
                self.article = newsData.articles
                self.onSuceess?()
            case .failure(let error):
                self.onAPIError?(error.localizedDescription)
            }
        }
    }
    
    // MARK: Get News From API using Alamofire
    func getNewsAlamofire() {
        let params: [String: Any] = [
            "page": APIManager.shared.currentPage,
            "pageSize": 10
        ]
        
        APIManager.shared.call(type: .getNews, params: params) { [weak self] (result: Result<News, CustomError>) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.afNewsSuccess.value = response.articles
                self.article.append(contentsOf: response.articles)
            case .failure(let error):
                self.afNewsError.value = error.localizedDescription
            }
        }
    }
    
}
