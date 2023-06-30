//
//  ImageDownload.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation

class ImageDownload: NSObject {
    
    // MARK: Variables
    static let shared = ImageDownload()
    var delegate: URLSessionDownloadDelegate?
    
    // image Download
    func downloadImage(url: String) {
        let urlString = url
        guard let url = URL(string: urlString) else { return }
        
        let config = URLSessionConfiguration.background(withIdentifier: urlString)
        let session = URLSession(configuration: config, delegate: delegate, delegateQueue: OperationQueue())
        let downloadTask = session.downloadTask(with: url)
        downloadTask.resume()
    }
    
}

