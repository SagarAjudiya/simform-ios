//
//  HomeScreenViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 13/05/23.
//

import UIKit

class HomeScreenViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak private var tblView: UITableView!
    @IBOutlet weak private var btnNotification: UIButton!
    @IBOutlet weak private var btnSort: UIButton!
    @IBOutlet weak private var imgProfile: UIImageView!
    @IBOutlet weak private var topView: UIView!
    @IBOutlet weak private var searchField: UITextField!
    @IBOutlet weak private var imgSearch: UIImageView!
    
    // MARK: Variables
    var searchResult = [Home]()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
//        navigationController?.isNavigationBarHidden = true
        tblView.delegate = self
        tblView.dataSource = self
        searchField.delegate = self
        searchResult = Home.homeData
        
        btnNotification.makeRoundBtn()
        btnSort.makeRoundBtn()
        imgProfile.makeRoundImage()
        searchField.returnKeyType = .search
        searchField.setLeftPaddingTF(padding: imgSearch.frame.width + 15.0)
        searchField.makeRoundView()
        searchField.attributedPlaceholder = NSAttributedString(
            string: Constant.String.searchHolder,
            attributes: [.foregroundColor: UIColor.white])
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

// MARK: Extension HomeScreenViewController
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.setHomeCellData(data: searchResult[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Constant.String.allDocuments
    }
    
}

// MARK: Extension HomeScreenViewController
extension HomeScreenViewController: HomeCellDelegate {

    func btnApprovalDtapped(cell: HomeCell) {
        guard let indexPath = tblView.indexPath(for: cell) else { return }
        searchResult[indexPath.row].isApproved.toggleState()
        tblView.reloadRows(at: [indexPath], with: .fade)
    }

}

// MARK: Extension HomeScreenViewController
extension HomeScreenViewController: UITextFieldDelegate {
    
    // MARK: Search Implementation
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let search = textField.text ?? ""
        if search.isEmpty {
            searchResult = Home.homeData
        } else {
            searchResult = Home.homeData.filter { $0.request.lowercased().contains(search.lowercased()) }
        }
        tblView.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
