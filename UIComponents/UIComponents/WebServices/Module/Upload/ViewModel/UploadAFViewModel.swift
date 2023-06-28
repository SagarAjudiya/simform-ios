//
//  UploadAFViewModel.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 03/07/23.
//

import Foundation
import UIKit

class UploadAFViewModel {
    
    // MARK: Variables
    var onUploadSuccess = Dynamic<Data?>(nil)
    var onUploadError = Dynamic<Error?>(nil)
    var onDownloadSuccess = Dynamic<UIImage?>(nil)
    var onDownloadError = Dynamic<Error?>(nil)
    
    // MARK: Functions
    func uploadImage(image: UIImage?) {
        APIManager.shared.uploadImageAF(image: image) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let image):
                self.onUploadSuccess.value = image
            case .failure(let error):
                self.onUploadError.value = error
            }
        }
    }
    
    func downloadImage(url: String) {
        APIManager.shared.downloadImageAF(url: url) { [weak self] image in
            guard let self = self else { return }
            if let image {
                self.onDownloadSuccess.value = image
            } else {
                print(self.onDownloadError.value ?? "")
            }
        }
    }
    
}
