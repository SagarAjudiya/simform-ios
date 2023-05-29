//
//  NavFirstViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 29/05/23.
//

import UIKit

class NavFirstViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak private var txtName: UITextField!
    @IBOutlet weak private var lblPhone: UILabel!
    @IBOutlet weak private var txtCompany: UILabel!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(1,#function)
        
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(1,#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(1,#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(1,#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(1,#function)
    }
    
    // Set Navigation
    private func setNavigationBar() {
        /// ios 13 onwards
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        
        /// pre ios 13
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        
        /// title and prompt
        navigationItem.prompt = "prompt"
        navigationItem.title = "Home"
        
        /// Set right buttons
        let btnNavBookmark = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
        btnNavBookmark.tintColor = .red
        let btnNavAdd = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        btnNavAdd.tintColor = .red
        let btnNavCancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        navigationItem.leftBarButtonItems = [btnNavBookmark, btnNavAdd]
        
        /// change back button image
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "back")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "back")
        
        /// Group of items
        navigationItem.centerItemGroups = [UIBarButtonItemGroup(barButtonItems: [btnNavAdd, btnNavBookmark], representativeItem: btnNavCancel)]
    }
    
    // user is logged in or not
    private func checkUserLogin() {
        if UserDefaultHelper.isLogedIn {
            Utility.changeVC(self, Constant.StoryBoard.navigation, NavForthViewController.identifier)
        } else {
            guard let navSecondVC = storyboard?.instantiateViewController(withIdentifier: NavSecondViewController.identifier) as? NavSecondViewController else {
                return }
            navSecondVC.delegateForSecond = self
            navSecondVC.delegate = self
            navSecondVC.name = txtName.text
            
            self.navigationController?.pushViewController(navSecondVC, animated: true)
        }
    }
    
    // MARK: IBActions
    /// use for unwind segue
    @IBAction func goFirstVC(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func btnSecondVCTapped(_ sender: UIButton) {
        checkUserLogin()
    }
    
}

// MARK: Extension NavFirstViewController
extension NavFirstViewController: NavSecondViewControllerProtocol {
    
    func setCompany(companyName: String) {
        print(companyName)
        txtCompany.text = companyName
    }
    
}

// MARK: Extension NavFirstViewController
extension NavFirstViewController: NavThirdViewControllerProtocol {
    
    func setPhoneNumber(phoneNumber: String) {
        print("Phone ",phoneNumber)
        lblPhone.text = phoneNumber
    }
    
}

// MARK: Extension NavFirstViewController
extension NavFirstViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print(#function)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print(#function)
    }
    
}
