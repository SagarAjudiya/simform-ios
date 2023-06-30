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
    
    // MARK: Get News From API
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
    
}
