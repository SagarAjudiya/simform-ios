//
//  InterestsViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 02/06/23.
//

import UIKit

protocol InterestsViewControllerProtocol: AnyObject {
    func sendSelectItem(items: [String])
}

class InterestsViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak var interestsClcView: UICollectionView!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    // MARK: Variables
    private var selectItem = [String]()
    weak var delegate: InterestsViewControllerProtocol?
    var clcview: UICollectionView?
    
    private enum CellConst {
        static let itemSpace = 10.0
        static let lineSpace = 15.0
        static let topC = 10.0
        static let bottomC = 10.0
        static let leftC = 10.0
        static let rightC = 10.0
        static let padding = leftC + rightC + lineSpace
    }
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setNavigationBar()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        interestsClcView.delegate = self
        interestsClcView.dataSource = self
        btnDone.setCornerRadius(radius: 4)
        btnDone.isEnabled = false
        contentView.setCornerRadius(radius: 12)
    }
    
    // MARK: Set Navigation
    private func setNavigationBar() {
        navigationItem.title = Constant.String.interests
        let textAttributes = [NSAttributedString.Key.foregroundColor: Color.signWhite]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.backgroundColor = Color.signPrimary
        navigationController?.navigationBar.isTranslucent = false
        
        /// Set back Icon
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: Image.arrowback)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: Image.arrowback)
        navigationController?.navigationBar.topItem?.title = ""
        
        Utility.changeStatusBarColor(color: Color.signPrimary)
    }
    
    // MARK: IBActions
    @IBAction func btnDoneTapped(_ sender: UIButton) {
        delegate?.sendSelectItem(items: selectItem)
        navigationController?.popViewController(animated: true)
        clcview?.reloadData()
    }
    
}

// MARK: Extension For UICollectionViewDelegate
extension InterestsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        InterestsModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InterestsCell.identifier, for: indexPath) as? InterestsCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.setCellData(data: InterestsModel.data[indexPath.row])
        return cell
    }
    
}

// MARK: Extension For InterestsCellProtocol
extension InterestsViewController: InterestsCellProtocol {
    
    func selectItems(cell: InterestsCell) {
        InterestsModel.data[interestsClcView.indexPath(for: cell)?.row ?? 0].isSelect = !InterestsModel.data[interestsClcView.indexPath(for: cell)?.row ?? 0].isSelect
        
        if InterestsModel.data[interestsClcView.indexPath(for: cell)?.row ?? 0].isSelect {
            selectItem.append(InterestsModel.data[interestsClcView.indexPath(for: cell)?.row ?? 0].interests)
            cell.lblView.backgroundColor = Color.signBtnbg
        } else {
            selectItem.removeAll(where: { $0.contains(InterestsModel.data[interestsClcView.indexPath(for: cell)?.row ?? 0].interests) })
            cell.lblView.backgroundColor = Color.signWhite
        }
        
        if selectItem.count > 2 {
            btnDone.isEnabled = true
        } else {
            btnDone.isEnabled = false
        }
    }
    
}

// MARK: Extension For UICollectionViewDelegateFlowLayout
extension InterestsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let clcWidth = collectionView.frame.width
        let size = CGSize(width: (clcWidth - (CellConst.padding)), height: collectionView.frame.height)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CellConst.itemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CellConst.lineSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: CellConst.topC, left: CellConst.leftC, bottom: CellConst.bottomC, right: CellConst.rightC)
    }
    
}
