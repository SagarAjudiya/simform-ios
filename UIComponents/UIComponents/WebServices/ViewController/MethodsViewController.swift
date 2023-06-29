//
//  MethodsViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/06/23.
//

import UIKit
import Reachability

class MethodsViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak var imgURL: UIImageView!
    @IBOutlet weak var pvLine: UIProgressView!
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var avIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imgUpload: UIImageView!
    @IBOutlet weak var btnUpload: UIButton!
    @IBOutlet weak var btnPickImage: UIButton!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        pvLine.progress = 0
        avIndicator.isHidden = true
    }
    
    // MARK: Functions
    private func downloadData() {
        let urlString =  "https://images.unsplash.com/photo-1421091242698-34f6ad7fc088?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80"
        guard let url = URL(string: urlString) else { return }
        
        let config = URLSessionConfiguration.background(withIdentifier: urlString)
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
        let task = session.downloadTask(with: url)
        task.resume()
    
    }
    
    private func uploadData() {
        ImageUploadViewModel.shared.delegate = self
        ImageUploadViewModel.shared.uploadImaggeUsingBinary(image: imgUpload)
    }
    
    // MARK: IBActions
    @IBAction func btnDownloadTapped(_ sender: Any) {
        avIndicator.isHidden = false
        avIndicator.startAnimating()
        imgURL.image = nil
        pvLine.progress = 0
        downloadData()
    }
    
    @IBAction func btnPickImageTapped(_ sender: UIButton) {
        openPickerView(sender)
    }
    
    @IBAction func btnUploadTapped(_ sender: UIButton) {
        uploadData()
    }
    
    private func openPickerView(_ sender: UIView) {
        ImagePickerHelper.shared.pick(sender, viewController: self, completionHandler: { [weak self] (image, _) in
            if let image {
                    self?.imgUpload.image = image
            }
        }, cancelHandler: { [weak self] in
            guard self != nil else { return }
        })
    }
    
}

// MARK: Extension MethodsViewController
extension MethodsViewController: URLSessionTaskDelegate {
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        print("\(totalBytesSent) \(totalBytesExpectedToSend)")
    }
    
}


// MARK: Extension MethodsViewController
extension MethodsViewController: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let data = try? Data(contentsOf: location) else { return }
        DispatchQueue.main.async { [weak self] in
            self?.imgURL.image = UIImage(data: data)
            self?.avIndicator.stopAnimating()
            self?.avIndicator.isHidden = true        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten / totalBytesExpectedToWrite)
        DispatchQueue.main.async { [weak self] in
            self?.pvLine.setProgress(progress, animated: true)
            self?.lblProgress.text = "\(progress * 100)%"
        }
    }
    
}
