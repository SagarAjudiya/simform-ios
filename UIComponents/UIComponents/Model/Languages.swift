//
//  Languages.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 12/05/23.
//

import Foundation

struct Languages {
    
    // MARK: Variables
    var langImg: String?
    var langName: String?
    
    // MARK: List
    static var langList: [Languages] = [
        Languages(langImg: "swift", langName: "Swift"),
        Languages(langImg: "java", langName: "Java"),
        Languages(langImg: "javascript", langName: "JavaScript"),
        Languages(langImg: "python", langName: "Python"),
        Languages(langImg: "go", langName: "Go"),
        Languages(langImg: "html", langName: "HTML")
    ]
    
}
