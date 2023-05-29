//
//  NavForthViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 30/05/23.
//

import UIKit

class NavForthViewController: BaseViewController {

    // MARK: View Controller lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(4,#function)
    }

    override func viewWillAppear(_ animated: Bool) {
        print(4,#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(4,#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(4,#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(4,#function)
    }
    
    // MARK: IBActions
    @IBAction func btnLogoutTapped(_ sender: UIButton) {
        UserDefaultHelper.isLogedIn = false
        print("Logout Success")
        navigationController?.popViewController(animated: false)
        Utility.changeVC(self, Constant.StoryBoard.navigation, Constant.StoryBoard.navigation)
    }
    
}
