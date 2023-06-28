//
//  MethodsViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 28/06/23.
//

import UIKit

class MethodsViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var imgURL: UIImageView!
    @IBOutlet weak var pvLine: UIProgressView!
    @IBOutlet weak var lblProgress: UILabel!
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var avIndicator: UIActivityIndicatorView!
    
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
    
    private func downloadData() {
        let urlString = "https://images.unsplash.com/photo-1421091242698-34f6ad7fc088?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        session.downloadTask(with: url).resume()
    }
    
    // MARK: IBActions
    @IBAction func btnDownloadTapped(_ sender: Any) {
        avIndicator.isHidden = false
        avIndicator.startAnimating()
        imgURL.image = nil
        pvLine.progress = 0
        downloadData()
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
