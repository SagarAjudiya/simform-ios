//
//  ImagePickerHelper.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 09/05/23.
//

import PhotosUI
import AVKit

class PHImagePickerHelper {

    private init() { }
    
    // MARK: Variables
    
    static let shared = PHImagePickerHelper()
    
    private var imageCompletionHandler: ((_ image: UIImage) -> Void)? = nil
    private var videoCompletionHandler: ((_ url: URL) -> UIViewController?)? = nil
    
    // MARK: Open and Select Images From Photos
    
    func pick(_ sender: UIViewController, imageCompletionHandler: @escaping (_ image: UIImage) -> Void, videoCompletionHandler: @escaping (_ url: URL) -> UIViewController?) {
        
        self.imageCompletionHandler = imageCompletionHandler
        self.videoCompletionHandler = videoCompletionHandler
        
        var phPickerConfig = PHPickerConfiguration()
        phPickerConfig.selectionLimit = 1
        phPickerConfig.filter = .any(of: [.images, .videos])
        
        // PHPicker ViewController
        let phPickerVC = PHPickerViewController(configuration: phPickerConfig)
        phPickerVC.delegate = self
        sender.present(phPickerVC, animated: true)
    }
    
    // MARK: Set Image In View
    
    private func setImageInView(_ result: PHPickerResult) {
        
        print("deal with image")
        let prov = result.itemProvider
        prov.loadObject(ofClass: UIImage.self) { image, error in
            if let image = image as? UIImage {
                DispatchQueue.main.async { [weak self] in
                    self?.imageCompletionHandler?(image)
                }
            }
        }
    }
    
    // MARK: Set Video in AVPlayer
    
    private func setVideoView(_ result: PHPickerResult) {
        
        print("deal with video")
        let movie = UTType.movie.identifier
        let provider = result.itemProvider
        provider.loadFileRepresentation(forTypeIdentifier: movie) { url, error in
            if let url = url {
                DispatchQueue.main.sync { [weak self] in
                    print("looping movie")
                    
                    if let viewController = self?.videoCompletionHandler?(url) {
                        AVPlayerHelper.shared.playVideo(viewController, url: url)
                    }
                }
            }
        }
    }
    
}

// MARK: Extension PHImagePickerHelper

extension PHImagePickerHelper: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true) {
            
            results.forEach { [weak self] result in
                let provider = result.itemProvider
                if provider.hasItemConformingToTypeIdentifier(UTType.movie.identifier) {
                    self?.setVideoView(result)
                } else if provider.canLoadObject(ofClass: UIImage.self) {
                    self?.setImageInView(result)
                }
            }
        }
    }
    
}

