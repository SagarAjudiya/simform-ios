//
//  Enumeration.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 10/05/23.
//

import Foundation
import UIKit

// MARK: Segment Image
enum SegmentControlImage: Int {
    
    case google = 0
    case facebook
    case instagram
    
}

// MARK: Search Scope Button
enum SearchScope: String, CaseIterable {
    
    case name
    case age
    case education
    
}

// MARK: Home Screen Approval Status
enum ApproveStatus {
    
    case approved
    case awaitingApproval
    
    func getStatus() -> String {
        switch self {
        case .approved: return Constant.String.approved
        case .awaitingApproval: return Constant.String.awaitingApproval
        }
    }
    
    mutating func toggleState() {
        switch self {
        case .approved:
            self = .awaitingApproval
        case .awaitingApproval:
            self = .approved
        }
    }
    
}

// MARK: Job Screen Job Types
enum JobTypes: Int {
    
    case recommanded
    case popular
    
    /// Count item of each job
    static func jobCount(section: Int) -> Int {
        let raw = JobTypes(rawValue: section) ?? .recommanded
            
        switch raw {
        case .recommanded:
            return JobModel.jobDictionary["recommanded"]?.count ?? 0
        case .popular:
            return JobModel.jobDictionary["popular"]?.count ?? 0
        }
    }
    
    /// Set data for section
    func setSectionData(section: Int) -> [JobModel.Job] {
        switch self {
        case .recommanded:
            return JobModel.jobDictionary["recommanded"] ?? []
        case .popular:
            return JobModel.jobDictionary["popular"] ?? []
        }
    }
    
}

// MARK: Job Home Screen Job Types
enum JobTypesHome: Int {
    
    case featured
    case popular
    
    /// Cell height each Type
    func getRowHeight() -> CGFloat {
        switch self {
        case .featured:
            return UITableView.automaticDimension
        case .popular:
            return 165
        }
    }
    
    /// Count items of each job
    static func itemCountSection(section: Int) -> Int {
        let raw = JobTypesHome(rawValue: section) ?? .featured
        
        switch raw {
        case .featured:
            return JobModel.jobHomeDictionary["featured"]?.count ?? 0
        case.popular:
            return JobModel.jobHomeDictionary["popular"]?.count ?? 0
        }
    }
    
    /// Set data for each section
    func setSectionData(section: Int) -> [JobModel.Job] {
        switch self {
        case .featured:
            return JobModel.jobHomeDictionary["featured"] ?? []
        case .popular:
            return JobModel.jobHomeDictionary["popular"] ?? []
        }
    }
    
}

// MARK: PickerView
enum PickDateMonth: Int, CaseIterable {
    
    case date
    case month
    
}

enum SelectLanguageType:Int, CaseIterable {
    
    case programmingLang
    case regionalLang
    
    func getLanguageType() -> String {
        switch self {
        case .programmingLang: return "Programming"
        case .regionalLang: return "Regional"
        }
    }
    
}

enum SetLanguageName: Int, CaseIterable {

    case selectLangType
    case setLang

    
    func rowsInComponent() -> Int {
        switch self {
        case .selectLangType: return PickerModel.pickLanguage["programmingLang"]?.count ?? 0
        case .setLang: return PickerModel.pickLanguage["regionalLang"]?.count ?? 0
        }
    }
    
    func titleForRow() -> [String]? {
        switch self {
        case .selectLangType: return PickerModel.pickLanguage["programmingLang"]
        case .setLang: return PickerModel.pickLanguage["regionalLang"]
        }
    }
    
}

// MARK: Chat Screen type
enum Messenger: Int {
    
    case sender
    case receiver
    
}
