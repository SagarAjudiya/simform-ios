//
//  CollectionViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 16/05/23.
//

import UIKit

class CollectionViewController: BaseViewController {

    // MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Cell Constant
    private enum CellConst {
        static let itemSpace = 10.0
        static let lineSpace = 10.0
        static let topC = 10.0
        static let bottomC = 10.0
        static let leftC = 10.0
        static let rightC = 10.0
        static let cellheight = 100.0
        static let cellCount = 3.0
        static let padding = leftC + rightC + lineSpace * (cellCount - 1)
        /// for calculate size of cell
        /// clcWidth - (left + right + lineSpace * (No of cell - 1) ) / No of cell
    }
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: ClcLangCell.identifier, bundle: nil), forCellWithReuseIdentifier: ClcLangCell.identifier)
    }
    
}

// MARK: Extension CollectionViewController
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Languages.langList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let lang = Languages.langList[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClcLangCell.identifier, for: indexPath) as? ClcLangCell else {
            return UICollectionViewCell()
        }
        cell.lblLangName.text = lang.langName
        cell.imgLang.image = UIImage(named: lang.langImg ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected cell: \(indexPath.row)")
    }

}

// MARK: Extension For UICollectionViewDelegateFlowLayout
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let clcWidth = collectionView.bounds.width
        let size = CGSize(width: (clcWidth - CellConst.padding)/CellConst.cellCount, height: CellConst.cellheight)
    
        return size
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CellConst.itemSpace
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CellConst.lineSpace
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CellConst.topC, left: CellConst.leftC, bottom: CellConst.bottomC, right: CellConst.rightC)
    }
    
}
