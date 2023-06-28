//
//  URLSessionHelper.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/06/23.
//

import Foundation
import Reachability

// MARK: struct
struct APIParams {
    
    struct NewsAPI: URLParams {
        
        var q = "q"
        static let apiKey = "apiKey"
        
        func getParams() -> [URLQueryItem] {
            let defParams = NewsAPI()
            return [
                URLQueryItem(name: defParams.q, value: q),
                URLQueryItem(name: APIParams.NewsAPI.apiKey, value: RequestItemsType.getNews.apiKey),
            ]
        }
    }
    
}

// MARK: protocol
protocol EndPointType {
    
    var baseURL: String { get }
    var version: String { get }
    var path: String { get }
    var httpMethod: String { get }
    var url: URL { get }
    var apiKey: String { get }
    
}

protocol URLParams {
    
    func getParams() -> [URLQueryItem]
    
}

// MARK: enum
enum HTTPMethod: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    
}

enum RequestItemsType {
    
    case getNews
    case uploadImage
    
}

enum APIError: Error {
    
    case invalidURL
    case requestFailed
    
}

// MARK: Helper Class for URLSession
class URLSessionHelper: NSObject {
    
    // MARK: variables
    static let shared = URLSessionHelper()
    var downloadedImage: ((UIImage?) -> Void)?
    var downloadProgress: ((Float) -> Void)?
    var uploadProgress: ((Float) -> Void)?

    func call<T: Codable>(baseURL: RequestItemsType, httpMethod: HTTPMethod, params: URLParams?, completionHandler: @escaping (Result<T, Error>) -> Void) {
        
        do {
            let reachability = try Reachability()
            if reachability.connection == .unavailable {
                return
            }
        } catch {
            print(error)
        }

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

// MARK: Extension RequestItemsType
extension RequestItemsType: EndPointType {
    
    var baseURL: String {
        switch self {
        case .getNews:           
            return "https://newsapi.org/"
        case .uploadImage:
            return "https://api.imgbb.com"
        }
    }

    var version: String {
        switch self {
        case .getNews:
            return "/v2"
        case .uploadImage:
            return "/1"
        }
    }
    
    var api: String {
        switch self {
        case .getNews:
            return "/api"
        case .uploadImage:
            return ""
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/everything"
        case .uploadImage:
            return "/upload"
        }
    }
    
    var httpMethod: String {
        switch self {
        case .getNews:
            return HTTPMethod.get.rawValue
        case .uploadImage:
            return HTTPMethod.post.rawValue
        }
    }
    
    var apiKey: String {
        switch self {
        case .getNews:
            return "485e790acd814aee899bb5f0ea24482c"
        case .uploadImage:
            return "4ca38f8ee7b2da0a00c6e5c5c40f4bd4"
        }
    }

    var url: URL {
        switch self {
        case .getNews:
            return URL(string: self.baseURL + self.version + self.path + "?q=apple&from=2023-06-26&to=2023-06-26&sortBy=popularity&apiKey=485e790acd814aee899bb5f0ea24482c")!
        case .uploadImage:
            return URL(string: self.baseURL + self.version + self.path)! 
        }
    }
    
}

