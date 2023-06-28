//
//  ImageUploadViewModel.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 29/06/23.
//

import Foundation
import UIKit

extension URLSessionHelper {
    
    func uploadImaggeUsingBinary(image: UIImageView, progress: @escaping (Float) -> Void) {
        var url = RequestItemsType.uploadImage.url
        uploadProgress = progress
        url.append(queryItems: [URLQueryItem(name: "key", value: RequestItemsType.uploadImage.apiKey)])
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = RequestItemsType.uploadImage.httpMethod
        let body = urlRequest.setMultipartFormDataBinaryImage(params: ["image" : ((image.image?.pngData() ?? Data() ), Date().getFormattedDate())])
        
        let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: body) { (data, urlResponse, error) in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(ImageUploadResponse.self, from: data)
                    print(response)
                } catch let error {
                    print("error \(error)")
                }
            }
        }
        uploadTask.delegate = self
        uploadTask.resume()
    }
    
}

// MARK: Extension URLSessionHelper
extension URLSessionHelper: URLSessionTaskDelegate {
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let progress = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
        uploadProgress?(progress * 100)
    }
        
}
