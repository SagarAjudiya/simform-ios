//
//  ExpandTableViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 16/05/23.
//

import UIKit

class ExpandTableViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak private var tblViewExpand: UITableView!
    
    // MARK: Variables
    /// for closure use
//    var expandCell: IndexSet = []
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        tblViewExpand.delegate = self
        tblViewExpand.dataSource = self
        tblViewExpand.rowHeight = UITableView.automaticDimension
    }

}

// MARK: Extension ExpandTableViewController
extension ExpandTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExpandableView.expandViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExpandTableViewCell.identifier, for: indexPath) as? ExpandTableViewCell else {
            return UITableViewCell()
        }
        
        cell.delegate = self
        cell.setExpandTableViewCellData(data: ExpandableView.expandViewData[indexPath.row])
        
        /// using closure
        
//        if expandCell.contains(indexPath.row) {
//            print("myprint",indexPath.row)
//            cell.lblText.numberOfLines = 0
//            cell.btnSeeMore.setTitle("See Less", for: .normal)
//        } else {
//            cell.lblText.numberOfLines = 3
//        }
        
//        cell.btnClicked = { [self] in
//            if self.expandCell.contains(indexPath.row) {
//                expandCell.remove(indexPath.row)
//            } else {
//                expandCell.insert(indexPath.row)
//            }
//
//            tableView.reloadRows(at: [indexPath], with: .automatic)
//        }
        
        return cell
    }
    
}

// MARK: Extension ExpandTableViewController
extension ExpandTableViewController: ExpandTableViewCellDelegateProtocol {
    
    func btnMoreTapped(cell: ExpandTableViewCell) {
        guard let indexPath = tblViewExpand.indexPath(for: cell) else { return }
        ExpandableView.expandViewData[indexPath.row].isExpand.toggle()
        
        tblViewExpand.reloadRows(at: [indexPath], with: .bottom)
    }
    
}
