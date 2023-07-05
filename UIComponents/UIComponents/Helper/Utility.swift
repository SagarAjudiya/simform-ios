//
//  Utility.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 16/05/23.
//

import UIKit

struct Utility {
    
    // MARK: Change ViewController
    static func changeVC(_ self: UIViewController, _ sbName: String, _ nextVCName: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: sbName, bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: nextVCName)
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    static func unixTimestampToDate(timestamp: Double) -> Date {
        return Date(timeIntervalSince1970: timestamp)
    }

    static func formatDate(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    static func changeStatusBarColor(color: UIColor) {
        if #available(iOS 13, *) {
            guard let frame = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame else {
                return
            }
            let statusBar = UIView(frame: frame)
            statusBar.backgroundColor = color
            UIApplication.shared.windows.first?.addSubview(statusBar)
        } else {
            guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {
                return
            }
            statusBar.backgroundColor = color
        }
    }
    
}
