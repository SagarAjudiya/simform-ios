//
//  ImageUploadViewModel.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 29/06/23.
//

import Foundation
import UIKit

class ImageUpload: NSObject {
    
    // MARK: Variables
    static let shared = ImageUpload()
    var uploadProgress: ((Int) -> Void)?
    
    //image upload using BinaryFile
    func uploadImaggeUsingBinary(image: UIImageView, progress: @escaping (Int) -> Void) {
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

// MARK: Extension ImageUpload
extension ImageUpload: URLSessionTaskDelegate {
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let progress = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
        uploadProgress?(Int(progress) * 100)
    }
        
}
