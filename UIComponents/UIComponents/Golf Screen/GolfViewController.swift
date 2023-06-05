//
//  GolgViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 05/06/23.
//

import UIKit

class GolfViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: GolfCell.identifier, bundle: nil), forCellReuseIdentifier: GolfCell.identifier)
        tableView.register(UINib(nibName: GolfSectionHeder.identifier, bundle: nil), forCellReuseIdentifier: GolfSectionHeder.identifier)
        
        let tableHeader = UINib(nibName: GolfHeader.identifier, bundle: nil).instantiate(withOwner: self).first as? GolfHeader
        tableView.tableHeaderView = tableHeader
    }
    
    
}

// MARK: Extension Tableview Delegate
extension GolfViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        GolfModel.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        GolfModel.data[section].user.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let sectionHeader = tableView.dequeueReusableCell(withIdentifier: GolfSectionHeder.identifier, for: indexPath) as? GolfSectionHeder else { return UITableViewCell() }
            sectionHeader.setCellData(data: GolfModel.data[indexPath.section])
            return sectionHeader
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GolfCell.identifier, for: indexPath) as? GolfCell else { return UITableViewCell() }
            cell.setCellData(data: GolfModel.data[indexPath.section].user[indexPath.row - 1])
            return cell
        }
        

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
