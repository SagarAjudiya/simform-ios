//
//  ImageViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 01/05/23.
//

import UIKit

class ImageViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var imgSelect: UIImageView!
    @IBOutlet private weak var progress: UIActivityIndicatorView!
    @IBOutlet private weak var imgOriginal: UIImageView!
    
    // MARK: View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
              
        setupView()
        tapGesture()
    }
    
    // MARK: SetUp Views

    private func setupView() {
        imgSelect.addBlur()
        imgSelect.makeRoundImage()
    }
    
    // tap on image
    private func tapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectImgTapped))
        imgSelect.isUserInteractionEnabled = true
        imgSelect.addGestureRecognizer(tap)
    }
    
    @objc private func selectImgTapped() {
        openPickerView(imgSelect)
    }
    
    // open picker with ImagePickerHelper Class
    func openPickerView(_ sender: UIView) {
        ImagePickerHelper.shared.pick(sender, viewController: self, completionHandler: { [weak self] (image, image2) in
            if let image, let image2 {
                    self?.imgOriginal.image = image
                    self?.imgSelect.image = image2
                print("Image Shown")
            } else {
                print("Opening Video")
            }
        }, cancelHandler: { [weak self] in
            guard let self else { return }
            print("Canceled Picking")
        })
    }
        
    // MARK: IBActions
    
    @IBAction func selectImgBtnTapped(_ sender: UIButton) {
        selectImgTapped()
        progress.stopAnimating()
    }
    
}

