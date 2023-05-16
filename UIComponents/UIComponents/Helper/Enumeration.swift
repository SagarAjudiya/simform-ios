//
//  Enumeration.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 10/05/23.
//

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
        case .approved: return "Approved"
        case .awaitingApproval: return "Awaiting Approval"
        }
    }
    
}
