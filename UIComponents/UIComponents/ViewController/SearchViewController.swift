//
//  SearchViewController.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 10/05/23.
//

import UIKit

class SearchViewController: BaseViewController {

    // MARK: View Controller lifecycle
    private let searchController = UISearchController(searchResultsController: ResultViewController())
    private let scopeBtn = SearchScope.allCases.map { $0.rawValue }
    
    // MARK: View Controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: SetUp Views
    private func setupViews() {
        title = "Search"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        searchController.searchBar.scopeButtonTitles = [SearchScope.name.rawValue, SearchScope.age.rawValue, SearchScope.education.rawValue]
    }

}

// MARK: Extension SearchViewController
extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
        
        let scopeIndex = searchController.searchBar.selectedScopeButtonIndex
        
        switch scopeBtn[scopeIndex] {
        case SearchScope.name.rawValue:
            let filterName = Student.studentData.filter { (student) -> Bool in
                student.name.lowercased().contains(text.lowercased())
            }
            print(filterName)
        case SearchScope.age.rawValue:
            let filterAge = Student.studentData.filter { (student) in
                student.age == Int(text)
            }
            print(filterAge)
        case SearchScope.education.rawValue:
            let filterEducation = Student.studentData.filter { (student) -> Bool in
                student.education.lowercased().contains(text.lowercased())
            }
            print(filterEducation)
        default:
            let filterName = Student.studentData.filter { (student) -> Bool in
                student.name.lowercased().contains(text.lowercased())
            }
            print(filterName)
        }
        
    }
    
}
