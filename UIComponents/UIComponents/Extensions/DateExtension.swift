//
//  DateFormatterExtension.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 26/05/23.
//

import Foundation

extension Date {
    
    func getFormattedDate(dateFormat: String = "dd/MM/yyyy", dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.timeStyle = timeStyle
        formatter.dateStyle = dateStyle
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
    
}
