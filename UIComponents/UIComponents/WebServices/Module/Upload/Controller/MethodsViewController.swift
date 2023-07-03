//
//  MethodsViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/06/23.
//

import UIKit
import Alamofire

class MethodsViewController: BaseViewController {

    // MARK: Variables
    var viewModel = MethodsViewModel()
    
    // MARK: IBOutlets
    @IBOutlet weak private var imgURL: UIImageView!
    @IBOutlet weak private var pvLine: UIProgressView!
    @IBOutlet weak private var lblProgress: UILabel!
    @IBOutlet weak private var btnDownload: UIButton!
    @IBOutlet weak private var avIndicator: UIActivityIndicatorView!
    @IBOutlet weak private var imgUpload: UIImageView!
    @IBOutlet weak private var btnUpload: UIButton!
    @IBOutlet weak private var btnPickImage: UIButton!
    @IBOutlet weak private var tfURL: UITextField!
    @IBOutlet weak private var lblUploadProgress: UILabel!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        pvLine.progress = 0
        avIndicator.isHidden = true
        lblUploadProgress.text = ""
    }
    
    // MARK: Bind ViewModel
    private func bindViewModel() {
        viewModel.uploadProgress.bind({ progress in
            DispatchQueue.main.async { [weak self] in
                self?.lblUploadProgress.text = "Uploading..."
                self?.lblUploadProgress.text = "\(Int(progress))%"
            }
        })

    }
    
    // MARK: Open PickerView
    private func openPickerView(_ sender: UIView) {
        ImagePickerHelper.shared.pick(sender, viewController: self, completionHandler: { [weak self] (image, _) in
            if let image {
                    self?.imgUpload.image = image
            }
        }, cancelHandler: { [weak self] in
            guard self != nil else { return }
        })
    }
    
    // MARK: IBActions
    @IBAction func btnDownloadTapped(_ sender: Any) {
        viewModel.downloadData(url: tfURL.text ?? "", delegate: self)
        avIndicator.isHidden = false
        avIndicator.startAnimating()
        imgURL.image = nil
        pvLine.progress = 0
        viewModel.downloadedImage.bind({ [weak self] image in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.imgURL.image = image
            }
        })
        viewModel.downloadProgress.bind({ [weak self] progress in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.pvLine.progress = progress ?? 0.0
                self.lblProgress.text = "\(Int(progress ?? 0.0))%"
                self.avIndicator.isHidden = true
            }
        })
    }
    
    @IBAction func btnPickImageTapped(_ sender: UIButton) {
        openPickerView(sender)
    }
    
    @IBAction func btnUploadTapped(_ sender: UIButton) {
        viewModel.uploadData(image: imgUpload)
    }
    
}

