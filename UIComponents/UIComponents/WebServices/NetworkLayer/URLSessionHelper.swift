//
//  URLSessionHelper.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/06/23.
//

import Foundation

struct URLS {
    
    static let baseScheme = "https://"
    static let newsBaseURL = "newsapi.org"
    static let newsVersion = "/v2"
    static let apiKey = "485e790acd814aee899bb5f0ea24482c"
    
}

struct APIParams {
    
    struct NewsAPI: URLParams {
        
        var q = "q"
        static let apiKey = "apiKey"
        
        func getParams() -> [URLQueryItem] {
            let defParams = NewsAPI()
            return [
                URLQueryItem(name: defParams.q, value: q),
                URLQueryItem(name: APIParams.NewsAPI.apiKey, value: URLS.apiKey),
            ]
        }
    }
}

protocol EndPointType {
    
    var baseURL: String { get }
    var version: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var url: URL { get }
    
}

protocol URLParams {
    
    func getParams() -> [URLQueryItem]
    
}

enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    
}

enum RequestItemsType {
    
    case getNews
    
}


enum APIError: Error {
    
    case invalidURL
    case requestFailed
    
}

class URLSessionHelper {
    static let shared = URLSessionHelper()

    func call<T: Codable>(baseURL: RequestItemsType, httpMethod: HTTPMethod, params: URLParams?, completionHandler: @escaping (Result<T, Error>) -> Void) {
        
        var urlRequset = URLRequest(url: baseURL.url)
        urlRequset.httpMethod = httpMethod.rawValue
        print(baseURL.url)
        
        
        let task = URLSession.shared.dataTask(with: urlRequset) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(decodedData))
            } catch {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
    
}


extension RequestItemsType: EndPointType {
    
    //Bundle.main.object(forInfoDictionaryKey: "BaseURL")
    var baseURL: String {
        switch self {
        case .getNews:
            return URLS.newsBaseURL
        }
    }
    
    var version: String {
        switch self {
        case .getNews:
            return URLS.newsVersion
        }
    }
    
    var api: String {
        switch self {
        case .getNews:
            return "/api"
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/everything"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getNews:
            return .get
        }
    }
        
    var url: URL {
        switch self {
        case .getNews:
            return URL(string: URLS.baseScheme + self.baseURL + self.version + self.path + "?q=apple&from=2023-06-26&to=2023-06-26&sortBy=popularity&apiKey=485e790acd814aee899bb5f0ea24482c")!
        }
    }
    
}

