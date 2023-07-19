//
//  UploadAFViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 03/07/23.
//

import UIKit

class UploadAFViewController: UIViewController {
    
    // MARK: Variables
    let viewModel = UploadAFViewModel()
    
    // MARK: Outlets
    @IBOutlet weak var imgUpload: UIImageView!
    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var imgDownload: UIImageView!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }

    // MARK: Setup Views
    private func setUpViews() {
        bindViewModel()
        imgUpload.image = UIImage(named: "swift")
    }
    
    // MARK: Bind ViewModel
    private func bindViewModel() {
        viewModel.onUploadSuccess.bind({ success in
            print(success?.description ?? "")
        })
        viewModel.onUploadError.bind({ error in
            print(error?.localizedDescription ?? "")
        })
        
        viewModel.onDownloadSuccess.bind({ [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.imgDownload.image = image
            }
            
        })
        viewModel.onDownloadError.bind({ error in
            print(error ?? "")
        })
    }
    
    // MARK: Actions
    @IBAction func btnUploadTapped(_ sender: UIButton) {
        viewModel.uploadImage(image: imgUpload.image)
    }
    
    @IBAction func btnDownloadTapped(_ sender: UIImage) {
        viewModel.downloadImage(url: tfUrl.text ?? "")
    }
    
    
}
