//
//  APIManager.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 03/07/23.
//

import Foundation
import Alamofire
import Reachability

class APIManager: NetworkManger {

    init() {}
    
    // MARK: Variables
    static var shared = APIManager()
    let reachability = try? Reachability()
    var currentPage = 1
    let totalPage = 100
    
    // MARK: API Call
    func call<T>(type: RequestItemsType, params: Alamofire.Parameters?, handler: @escaping (Result<T, CustomError>) -> Void) where T: Codable {
        guard reachability?.connection != .unavailable else {
            handler(.failure(CustomError(title: "App Name", body: "No Internet")))
            return
        }
        
        AF.request(type.url, method: .get, parameters: params, encoding: type.encoding).validate().responseData(completionHandler: { [weak self] data in
            guard let self = self else { return }
            if self.handleResponseCode(res: data) {
                do {
                    guard let jsonData = data.data else {
                        handler(.failure(CustomError(title: "App Name", body: "Data not found")))
                        return
                    }
                    print(jsonData)
                    let result = try JSONDecoder().decode(T.self, from: jsonData)
                    handler(.success(result))
                } catch {
                    handler(.failure(CustomError(title: "App Name", body: "Server side error")))
                }
            } else {
                handler(.failure(CustomError(title: "App Name", body: "Some error occured")))
            }
        })
    }
    
    // MARK: Check request code
    private func handleResponseCode(res: AFDataResponse<Data>?) -> Bool {
        var isSuccess = false
        guard let dataResponse = res else {
            return isSuccess
        }
        
        guard let response = dataResponse.response else {
            return isSuccess
        }
        
        switch response.statusCode {
        case 200...300:
            isSuccess = true
        default:
            break
        }
        return isSuccess
    }
    
    // MARK: Download Image
    func downloadImageAF(url: String, completionHandler: @escaping ((UIImage?) -> Void)) {
        AF.request(url).responseData(completionHandler: { response in
            if let data = response.data {
                let image = UIImage(data: data)
                completionHandler(image)
            } else {
                completionHandler(nil)
            }
        })
    }
    
    // MARK: Upload Image
    func uploadImageAF(image: UIImage?, completionHandler: @escaping ((Result<Data?, AFError>) -> Void)) {
        guard let image else { return }
        guard let imageData = image.pngData() else { return }
        
        var url = RequestItemsType.uploadImage.url
        url.append(queryItems: [URLQueryItem(name: "key", value: RequestItemsType.uploadImage.apiKey)])
        
        AF.upload(multipartFormData: { mData in
            mData.append(imageData, withName: Date().getFormattedDate(), mimeType: "image/png")
        }, to: url)
        .response { respones in
            completionHandler(respones.result)
        }
    }
    
}
