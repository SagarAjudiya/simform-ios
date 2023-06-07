//
//  UserDefaultHelper.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 31/05/23.
//

import Foundation

struct UserDefaultHelper {
    
    static var isLogedIn: Bool {
        get {
            UserDefaults.standard.bool(forKey: #function)
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
    
    static var userName: String {
        get {
            UserDefaults.standard.string(forKey: #function) ?? ""
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
    
    static var email: String {
        get {
            UserDefaults.standard.string(forKey: #function) ?? ""
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
    
    static var password: String {
        get {
            UserDefaults.standard.string(forKey: #function) ?? ""
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
    
}
