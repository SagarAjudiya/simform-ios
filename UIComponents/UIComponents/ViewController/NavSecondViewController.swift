//
//  NavSecondViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 29/05/23.
//

import UIKit

protocol NavSecondViewControllerProtocol: AnyObject{
    func setCompany(companyName: String)
}

class NavSecondViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak private var lblName: UILabel!
    @IBOutlet weak private var txtCompany: UITextField!
    
    @IBOutlet weak private var txtRUserName: UITextField!
    @IBOutlet weak private var txtREmail: UITextField!
    @IBOutlet weak private var txtRPassword: UITextField!
    @IBOutlet weak private var btnRegister: UIButton!
    
    // MARK: Variables
    var name: String?
    weak var delegate: NavSecondViewControllerProtocol?
    weak var delegateForSecond: NavThirdViewControllerProtocol?
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(2,#function)

        setupViews()
        setNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(2,#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(2,#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(2,#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print(2,#function)
    }

    // MARK: SetUp Views
    private func setupViews() {
        lblName.text = name
    }
    
    // Register User
    private func registerUser() {
        UserDefaultHelper.userName = txtRUserName.text ?? ""
        UserDefaultHelper.email = txtREmail.text ?? ""
        UserDefaultHelper.password = txtRPassword.text ?? ""
    }
    
    // Set Navigation
    private func setNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Login"
        navigationItem.largeTitleDisplayMode = .always
        
        let imgNav = UIImageView(image: UIImage(named: "onboard1"))
        imgNav.contentMode = .scaleAspectFit
        navigationItem.titleView = imgNav
    }
    
    // MARK: IBActions
    @IBAction func btnFirstVCTapped(_ sender: UIButton) {
        delegate?.setCompany(companyName: txtCompany.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnThirdVCtapped(_ sender: UIButton) {
        guard let navThirdVC = storyboard?.instantiateViewController(withIdentifier: NavThirdViewController.identifier) as? NavThirdViewController else { return }
        navThirdVC.delegate = delegateForSecond
        self.navigationController?.pushViewController(navThirdVC, animated: true)
    }
    
    @IBAction func btnRegisterTapped(_ sender: UIButton) {
        registerUser()
        Utility.changeVC(self, Constant.StoryBoard.navigation, NavThirdViewController.identifier)
    }
    
    @IBAction func btnLogInTapped(_ sender: UIButton) {
        Utility.changeVC(self, Constant.StoryBoard.navigation, NavThirdViewController.identifier)
    }
    
}

