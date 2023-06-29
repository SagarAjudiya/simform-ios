//
//  ImageUploadViewModel.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 29/06/23.
//

import Foundation
import UIKit

class ImageUploadViewModel: NSObject {
    
    override init() {
        super.init()
    }
    
    static let shared = ImageUploadViewModel()
    var delegate: URLSessionTaskDelegate?

    //image upload using BinaryFile
    func uploadImaggeUsingBinary(image: UIImageView) {
        if var url = URL(string: "https://api.imgbb.com/1/upload") {
            url.append(queryItems: [URLQueryItem(name: "key", value: "4ca38f8ee7b2da0a00c6e5c5c40f4bd4")])

            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            let body = urlRequest.setMultipartFormDataBinaryImage(params: ["image" : ((image.image?.pngData() ?? Data() ), "upload.jpeg")])

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
            uploadTask.delegate = delegate
            uploadTask.resume()
        }
    }

}
