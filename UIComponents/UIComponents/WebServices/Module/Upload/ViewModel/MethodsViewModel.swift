//
//  File.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation
import UIKit

class MethodsViewModel {
    
    // MARK: Variables
    var uploadProgress = Dynamic<Float>(0.0)
    var downloadedImage = Dynamic<UIImage?>(nil)
    var downloadProgress = Dynamic<Float?>(0.0)
        
    // MARK: Functions
    func downloadData(url: String, delegate: MethodsViewController) {
        URLSessionHelper.shared.downloadedImage = { [weak self] image in
            guard let self = self else { return }
            self.downloadedImage.value = image
        }
        URLSessionHelper.shared.downloadProgress = { [weak self] progress in
            guard let self = self else { return }
            self.downloadProgress.value = progress
        }
        URLSessionHelper.shared.downloadImage(url: url)
    }
    
    func uploadData(image: UIImageView) {
        URLSessionHelper.shared.uploadImaggeUsingBinary(image: image){ [weak self] progress in
            self?.uploadProgress.value = progress
        }
    }
    
}


