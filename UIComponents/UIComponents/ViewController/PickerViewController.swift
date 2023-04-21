//
//  PHPickerViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 09/05/23.
//

import UIKit

class PickerViewController: BaseViewController {

    // MARK: IBOutlets
    
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var btnChangeImage: UIButton!
    
    // MARK: View Controller lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActions

    @IBAction func btnChangeImageTap(_ sender: UIButton) {
        openPickerView()
    }
    
    // open pickerview for select image
    private func openPickerView() {
        PHImagePickerHelper.shared.pick(self, imageCompletionHandler: { [weak self] image in
            guard let self else { return }
            print("showing image")
            self.imgView.image = image
        }, videoCompletionHandler: { [weak self] (url) in
            guard let self else { return nil }
            print("showing movie")
            return self
        })
    }
    
}

