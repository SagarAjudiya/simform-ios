//
//  ToolBarViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 04/05/23.
//

import UIKit

class ToolBarViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet private weak var lblText: UILabel!
    @IBOutlet private weak var playPauseBtn: UIBarButtonItem!
    
    private var isPlay = true
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActions
    @IBAction func rewindClicked(_ sender: UIBarButtonItem) {
        lblText.text = Constant.String.rewinding
    }
    
    @IBAction func playPauseClicked(_ sender: UIBarButtonItem) {
        playPause()
    }
    
    @IBAction func forwardClicked(_ sender: UIBarButtonItem) {
        lblText.text = Constant.String.forwarding
    }
    
    // set PlayPause Image
    private func playPause() {
        if isPlay {
            playPauseBtn.image = UIImage(systemName: "play.fill")
            lblText.text = Constant.String.pausing
            isPlay = false
        } else {
            playPauseBtn.image = UIImage(systemName: "pause.fill")
            lblText.text = Constant.String.playing
            isPlay = true
        }
    }
    
}
