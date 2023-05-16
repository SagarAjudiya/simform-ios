//
//  MainScreenViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 15/05/23.
//

import UIKit

class MainScreenViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak private var btnHomeScreen: UIButton!
    @IBOutlet weak private var btnExpandTableView: UIButton!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: IBActions
    @IBAction func btnHomeScreenTapped(_ sender: UIButton) {
        let homeScreenSB = UIStoryboard(name: "HomeScreen", bundle: nil)
        let homeScreenVC = homeScreenSB.instantiateViewController(withIdentifier: "HomeScreenViewController")
        navigationController?.pushViewController(homeScreenVC, animated: true)
    }
    
}
