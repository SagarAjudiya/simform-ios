//
//  JobHomeScreenCell.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 23/05/23.
//

import UIKit

class JobHomeScreenCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak private var clcView: UICollectionView!
    @IBOutlet weak private var pageControl: UIPageControl!
    
    private var sectionCurrent = 0
    
    // MARK: Cell Constant
    private enum CellConstant {
        static let topC = 0.0
        static let leftC = 0.0
        static let bottomC = 0.0
        static let rightC = 0.0
        static let lineSpace = 15.0
        static let itemSpace = 0.0
        static let cellCount = 2.0
        static let numberOfSections = 2
        static let padding = leftC + rightC + lineSpace
        /// for calculate size of cell
        /// clcWidth - (left + right + lineSpace * (No of cell - 1) ) / No of cell
    }
    
    // MARK: View Controller lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        clcView.delegate = self
        clcView.dataSource = self
        clcView.register(UINib(nibName: FeaturedViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: FeaturedViewCell.identifier)
        clcView.register(UINib(nibName: ClcJobViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ClcJobViewCell.identifier)
        clcView.register(UINib(nibName: HeaderView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier);
        clcView.isPagingEnabled = true
        
        
        pageControl.numberOfPages = JobModel.jobHomeDictionary["featured"]?.count ?? 0
        pageControl.preferredIndicatorImage = UIImage(named: "jcircle")
        pageControl.preferredCurrentPageIndicatorImage = UIImage(named: "jrec")
    }
    
    func setCellData(currentSection: Int) {
        if currentSection != JobTypesHome.featured.rawValue {
            pageControl.isHidden = true
        }
        sectionCurrent = currentSection
    }
    
}

// MARK: JobHomeScreenCell
extension JobHomeScreenCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return JobTypesHome.itemCountSection(section: sectionCurrent)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let raw = JobTypesHome(rawValue: sectionCurrent) ?? .featured
        
        switch raw {
        case .featured:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedViewCell.identifier, for: indexPath) as? FeaturedViewCell else {
                return UICollectionViewCell()
            }

            let featured = JobTypesHome.featured.setSectionData(section: indexPath.row)
            cell.setCellData(data: featured[indexPath.row])
            return cell

        case .popular:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ClcJobViewCell.identifier, for: indexPath) as? ClcJobViewCell else {
                return UICollectionViewCell()
            }
            let popular = JobTypesHome.popular.setSectionData(section: indexPath.row)
            print("popular",popular.count)

            cell.setJobCellData(data: popular[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let raw = JobTypesHome(rawValue: sectionCurrent) ?? .featured
        
        switch raw {
        case .featured:
            return CGSize(width: clcView.frame.width - CellConstant.padding, height: clcView.frame.height)
        case .popular:
            return CGSize(width: (clcView.frame.width - CellConstant.padding) / CellConstant.cellCount, height: clcView.frame.height)
        }
    }
        
}

// MARK: Extension JobHomeScreenCell
extension JobHomeScreenCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: CellConstant.topC, left: CellConstant.leftC, bottom: CellConstant.bottomC, right: CellConstant.rightC)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CellConstant.lineSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CellConstant.itemSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
}
