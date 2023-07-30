//
//  NavThirdViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 29/05/23.
//

import UIKit

// MARK: Protocol
protocol NavThirdViewControllerProtocol: AnyObject {
    func setPhoneNumber(phoneNumber: String)
}

class NavThirdViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak private var txtPhone: UITextField!
    @IBOutlet weak private var txtLUserName: UITextField!
    @IBOutlet weak var txtLPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    // MARK: Variables
    weak var delegate: NavThirdViewControllerProtocol?
    private let searchController = UISearchController()
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(3,#function)
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(3,#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(3,#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(3,#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(3,#function)
    }
    
    // User Login
    private func userLogin() {
        let userName = UserDefaultHelper.userName
        let email = UserDefaultHelper.email
        let password = UserDefaultHelper.password
        
        if txtLUserName.text == userName && txtLPassword.text == password {
            UserDefaultHelper.isLogedIn = true
            Utility.changeVC(self, Constant.StoryBoard.navigation, NavForthViewController.identifier)
        } else {
            print("Please Enter Correct Details")
        }
    }
    
    // Set Navigation
    private func setNavigationBar() {
        title = "Search"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    // MARK: IBActions
    @IBAction func btnRootVCTapped(_ sender: UIButton) {
        delegate?.setPhoneNumber(phoneNumber: txtPhone.text ?? "")
        
        navigationController?.popSpecificViewController(ofClass: NavFirstViewController.self)
    }
    
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        userLogin()
    }
    
    @IBAction func btnSignUpTapped(_ sender: UIButton) {
        Utility.changeVC(self, Constant.StoryBoard.navigation, NavSecondViewController.identifier)
    }
    
}

// MARK: Extension NavThirdViewController
extension NavThirdViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
    }
    
}
