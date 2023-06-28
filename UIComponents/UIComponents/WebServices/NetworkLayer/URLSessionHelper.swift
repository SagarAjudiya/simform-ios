//
//  URLSessionHelper.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/06/23.
//

import Foundation

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
    case invalide
}

class URLSessionHelper {
    
    static let shared = URLSessionHelper()
    let url = "https://newsapi.org/v2/everything?q=apple&from=2023-06-26&to=2023-06-26&sortBy=popularity&apiKey=485e790acd814aee899bb5f0ea24482c"

    
    func call<T: Codable>(url: String, httpMethod: HTTPMethod, params: URLParams?, completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completionHandler(.failure(APIError.invalide))
            return
        }
        var urlRequset = URLRequest(url: url)
        urlRequset.httpMethod = httpMethod.rawValue
        
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
        return "https://newsapi.org/"
    }
    
    var version: String {
        return "v2/"
    }
    
    var api: String {
        return "api"
    }
    
    var path: String {
        return "everything"
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var url: URL {
        return URL(string: self.baseURL + self.version + self.path + "?" + "key=f8fe9a449ea4b2a9b7387b9e0d3d59c7")!
    }
    
}

