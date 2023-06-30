//
//  File.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/06/23.
//

import Foundation
import UIKit

class MethodsViewModel {
    
    var progress = Dynamic<Int>(0)
        
    // MARK: Functions
    func downloadData(url: String, delegate: MethodsViewController) {
        ImageDownload.shared.delegate = delegate
        ImageDownload.shared.downloadImage(url: url)
    }
    
    func uploadData(image: UIImageView) {
        ImageUpload.shared.uploadImaggeUsingBinary(image: image){ [weak self] progress in
            self?.progress.value = progress
        }
    }
    
}


