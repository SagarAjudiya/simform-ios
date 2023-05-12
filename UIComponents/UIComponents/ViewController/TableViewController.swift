//
//  TableViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 12/05/23.
//

import UIKit

class TableViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak private var tblView: UITableView!
    @IBOutlet weak var btnEdit: UIBarButtonItem!
    
    // MARK: Variables
    private let sectionTitles = ["Programming", "Regional", "Local", "International"]
    private let headerTitles = ["Header1", "Header2", "Header3", "Header4"]
    private let footerTitles = ["Footer1", "Footer2", "Footer3", "Footer4"]
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(UINib(nibName: LanguageCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: LanguageCell.cellIdentifier)
    }
    
    // MARK: IBActions
    @IBAction func btnEditTapped(_ sender: Any) {
        tblView.isEditing = !tblView.isEditing
        btnEdit.title = (tblView.isEditing ? Constant.String.done : Constant.String.edit)
    }
    
}

// MARK: Extension TableViewController
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Languages.langList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lan = Languages.langList[indexPath.row]
        guard let cell = tblView.dequeueReusableCell(withIdentifier: LanguageCell.cellIdentifier) as? LanguageCell else {
            return UITableViewCell()
        }
        cell.imgViewCell.image = UIImage(named: lan.langImg ?? "")
        cell.lblCell.text = lan.langName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select", Languages.langList[indexPath.row])
        
        let alertControl = UIAlertController(title: Constant.String.changeName, message: nil, preferredStyle: .alert)
        alertControl.addTextField()
        
        let cancelAction = UIAlertAction(title: Constant.String.cancel, style: .cancel) { _ in
            print("Canelled")
        }
        
        let submitAction = UIAlertAction(title: Constant.String.ok, style: .default) { _ in
            if let tf = alertControl.textFields?.first {
                Languages.langList[indexPath.row].langName = tf.text ?? ""
                self.tblView.reloadData()
            }
            
        }
        alertControl.addAction(submitAction)
        alertControl.addAction(cancelAction)
        present(alertControl, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Deselect", Languages.langList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return footerTitles[section]
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let edit = UIContextualAction(style: .normal, title: Constant.String.edit) { _, _, _ in
            /// implement in fature
        }
        let delete = UIContextualAction(style: .destructive, title: Constant.String.delete) { _, _, _ in
            Languages.langList.remove(at: indexPath.row)
            self.tblView.deleteRows(at: [indexPath], with: .fade)
        }
        let swipeConfig = UISwipeActionsConfiguration(actions: [delete, edit])
        return swipeConfig
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: Constant.String.delete) { _, _, _ in
            Languages.langList.remove(at: indexPath.row)
            self.tblView.deleteRows(at: [indexPath], with: .fade)
        }
        let swipeConfig = UISwipeActionsConfiguration(actions: [delete])
        return swipeConfig
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        Languages.langList.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
}
