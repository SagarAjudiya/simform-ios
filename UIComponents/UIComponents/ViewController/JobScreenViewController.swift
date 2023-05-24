//
//  JobScreenViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 17/05/23.
//

import UIKit

class JobScreenViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak private var clcView: UICollectionView!
    @IBOutlet weak private var lblresult: UILabel!
    @IBOutlet weak private var lineView: UIView!
    @IBOutlet weak private var searchField: UITextField!
    
    // MARK: Cell Constant
    private enum CellConst {
        static let cvHeight = 160.0
        static let cvHeaderHeight = 56.0
        static let itemSpace = 15.0
        static let lineSpace = 15.0
        static let topC = 0.0
        static let leftC = 24.0
        static let bottomC = 0.0
        static let rightC = 24.0
        static let cellCount = 2.0
        /// for calculate size of cell
        /// clcWidth - (left + right + lineSpace * (No of cell - 1) ) / No of cell
        static let padding = leftC + rightC + lineSpace
    }
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        navigationController?.isNavigationBarHidden = true
        clcView.delegate = self
        clcView.dataSource = self
        clcView.backgroundColor = Color.jbg
        clcView.register(UINib(nibName: ClcJobViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ClcJobViewCell.identifier)
        clcView.register(UINib(nibName: HeaderView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier);
        
        lblresult.textColor = Color.jGreen
        lineView.backgroundColor = Color.jBlack
        
        searchField.delegate = self
        searchField.setLeftPaddingTF(padding: 18)
        searchField.setRightPaddingTF(padding: 30)
        searchField.borderStyle = .none
        searchField.returnKeyType = .search
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

// MARK: Extension JobScreenViewController
extension JobScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(JobModel.jobDictionary.keys.count)
        return JobTypes.jobCount(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClcJobViewCell.identifier, for: indexPath) as? ClcJobViewCell else {
            return UICollectionViewCell()
        }
        
        let cases = JobTypes(rawValue: indexPath.section) ?? .recommanded
        
        switch cases {
        case .recommanded:
            let recommanded = JobTypes.recommanded.setSectionData(section: indexPath.section)
            cell.setJobCellData(data: recommanded[indexPath.row])
        case .popular:
            let popular = JobTypes.popular.setSectionData(section: indexPath.section)
            cell.setJobCellData(data: popular[indexPath.row])
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return JobModel.jobDictionary.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else { return UICollectionReusableView() }

            let cases = JobTypes(rawValue: indexPath.section) ?? .recommanded

            switch cases {
            case .recommanded:
                headerView.setHeaderTitle(title: Constant.String.recommanded)
            case .popular:
                headerView.setHeaderTitle(title: Constant.String.popular)
            }
            return headerView
        }
        return UICollectionReusableView()
    }

}

// MARK: Extension JobScreenViewController
extension JobScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let clcWidth = collectionView.bounds.width
        return CGSize(width: (clcWidth - CellConst.padding) / CellConst.cellCount, height: CellConst.cvHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CellConst.itemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CellConst.lineSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CellConst.topC, left: CellConst.leftC, bottom: CellConst.bottomC, right: CellConst.rightC)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: (collectionView.bounds.width - CellConst.padding), height: CellConst.cvHeaderHeight)
    }
    
}

// MARK: Extension JobScreenViewController
extension JobScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
