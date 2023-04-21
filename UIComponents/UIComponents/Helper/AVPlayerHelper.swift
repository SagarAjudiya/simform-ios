//
//  AVPlayerHelper.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 11/05/23.
//

import Foundation
import AVKit

class AVPlayerHelper {
    
    private init() {}
    
    // MARK: Variables
    
    static let shared = AVPlayerHelper()
    
    let playerViewController = AVPlayerViewController()
    
    // MARK: AVPlayerHelper Methods
    func playVideo(_ sender: UIViewController, url: URL) {

        let player = AVPlayer(url: url)
        playerViewController.player = player
        sender.present(playerViewController, animated: true) { [weak self] in
            print("Playing Video")
            self?.playerViewController.player?.play()
        }
        
    }
    
}
