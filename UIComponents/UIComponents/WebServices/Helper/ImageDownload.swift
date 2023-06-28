//
//  ImageDownload.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation
import UIKit

extension URLSessionHelper {
    
    // MARK: Download Image
    func downloadImage(url: String) {
        let urlString = url
        guard let url = URL(string: urlString) else { return }
        
        let config = URLSessionConfiguration.background(withIdentifier: urlString)
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
        let downloadTask = session.downloadTask(with: url)
        downloadTask.resume()
    }
    
}

// MARK: Extension URLSessionHelper
extension URLSessionHelper: URLSessionDownloadDelegate {

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else { return }
        downloadedImage?(UIImage(data: data))
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        downloadProgress?((progress * 100))
    }

}
