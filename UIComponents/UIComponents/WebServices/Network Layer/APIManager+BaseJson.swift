//
//  APIManager+BaseJson.swift
//  ScientistApp
//
//  Created by Shilpriya Shah on 10/05/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

/// This is base json model of codable type
/// In throught app response base model will be same.
class BaseJsonModel<T: Codable>: Codable {
    let status: Bool
    let data: T
}
