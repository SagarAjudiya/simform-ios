//
//  JobHomeScreenViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 22/05/23.
//

import UIKit

class JobHomeScreenViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var redDot: UIImageView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var btnFilter: UIButton!
    
    // MARK: Table Constant
    private enum TableConst {
        static let numberOfRowsInSection = 1
        static let heightForHeaderInSection = 56.0
    }
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        searchField.delegate = self
        
        setupTableView()
        
        redDot.makeRoundImage()
        redDot.setBorderWidth(width: 2)
        redDot.setBorderColor(color: Color.jWhite ?? .white)
        
        searchField.setLeftPaddingTF(padding: 36)
        searchField.setRightPaddingTF(padding: 12)
        searchField.setCornerRadius(radius: 12)
        btnFilter.setCornerRadius(radius: 12)
    }
    
    // MARK: Setup TableView
    private func setupTableView() {
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib(nibName: JobHomeScreenCell.identifier, bundle: nil), forCellReuseIdentifier: JobHomeScreenCell.identifier)
        tblView.register(UINib(nibName: TableHeader.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: TableHeader.identifier)
    }
   
}

// MARK: Extension JobHomeScreenViewController
extension JobHomeScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("Section Count", JobModel.jobHomeDictionary.keys.count)
        return JobModel.jobHomeDictionary.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TableConst.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: JobHomeScreenCell.identifier, for: indexPath) as? JobHomeScreenCell else {
            return UITableViewCell()
        }
        
        cell.setCellData(currentSection: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return JobTypesHome(rawValue: indexPath.row)?.getRowHeight() ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableHeader.identifier) as? TableHeader else {
            return UIView()
        }
        
        let raw = JobTypesHome(rawValue: section) ?? .featured
        
        switch raw {
        case .featured:
            headerView.lblheaderTitle.text = Constant.String.featured
        case .popular:
            headerView.lblheaderTitle.text = Constant.String.popular
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        TableConst.heightForHeaderInSection
    }
            
}

// MARK: Extension JobHomeScreenViewController
extension JobHomeScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
