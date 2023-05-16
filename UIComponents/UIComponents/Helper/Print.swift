//
//  Print.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 12/05/23.
//

// MARK: Print Cancel In Debug Mode
func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    Swift.print(items, separator: separator, terminator: terminator)
    #endif
}
