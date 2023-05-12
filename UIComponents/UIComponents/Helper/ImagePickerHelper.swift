//
//  ImagePickerHelper.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 09/05/23.
//

import UIKit
import AVKit

class ImagePickerHelper: NSObject {
    
    private override init() {}
    
    // MARK: Variables
    
    static let shared = ImagePickerHelper()
    
    private let imagePicker = UIImagePickerController()
    private weak var viewController: UIViewController? = nil
    private var completionHandler: ((_ image: UIImage?, _ cImage: UIImage?) -> Void)? = nil
    private var cancelHandler: (() -> Void)? = nil
    
    // MARK: Open and Select Images From Photos
    
    func pick(_ sender: UIView, viewController: UIViewController, completionHandler: @escaping (_ image: UIImage?, _ cImage: UIImage?) -> Void, cancelHandler: @escaping () -> Void) {
        
        self.viewController = viewController
        self.completionHandler = completionHandler
        self.cancelHandler = cancelHandler
        
        createDialogAndOpenPicker()
    }
    
    // MARK: Create Dialog And Open PhotoPicker
    
    private func createDialogAndOpenPicker() {
        
        // create alert dialog
        let alert = UIAlertController(title: "Select Image", message: "Select Image From?", preferredStyle: .actionSheet)
        
        // create button for dialog
        let btnCamera = UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
            self?.showImgPicker(selectFrom: .camera)
        }
        let btnLibrary = UIAlertAction(title: "Photos", style: .default) { [weak self] _ in
            self?.showImgPicker(selectFrom: .photoLibrary)
        }
        let btnCancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(btnCamera)
        alert.addAction(btnLibrary)
        alert.addAction(btnCancel)
        viewController?.present(alert, animated: true)
        
    }
    
    // MARK: Open and Show ImagePicker
    
    private func showImgPicker(selectFrom: UIImagePickerController.SourceType) {
        
        guard UIImagePickerController.isSourceTypeAvailable(selectFrom) else {
            print("Selected source not available")
            return
        }
        
        // imagepicker ViewController
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = selectFrom
        imagePicker.allowsEditing = true
        imagePicker.mediaTypes = [UTType.movie.identifier, UTType.image.identifier]
        viewController?.present(imagePicker, animated: true)
    }
    
    
}

typealias ImageAndUINavigationDelegate = UINavigationControllerDelegate & UIImagePickerControllerDelegate

// MARK: Extension ImagePickerHelper

extension ImagePickerHelper: ImageAndUINavigationDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String
        print(mediaType ?? "")
        
        // check type of media
        switch mediaType {
            
        case UTType.image.identifier:
            
            print("Selected media is image")
            let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            let editedImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage

            DispatchQueue.main.async { [weak self] in
                self?.completionHandler?(originalImage, editedImage)
            }
            
        case UTType.movie.identifier:
            
            print("Selected media is video")
            let videoUrl = info[UIImagePickerController.InfoKey.mediaURL] as! URL
            print(videoUrl)
            
            picker.dismiss(animated: true)
            
            // open AVPlayer controller
            if let viewController {
                AVPlayerHelper.shared.playVideo(viewController, url: videoUrl)
            }
            
        default:
            print("Mismatched type: \(mediaType ?? "")")
            
        }
        
        picker.dismiss(animated: true)
    }
    
}
