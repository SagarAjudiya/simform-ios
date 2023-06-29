//
//  APIManager+Error.swift
//  ScientistApp
//
//  Created by Shilpriya Shah on 10/05/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class CustomError: Error {

    // MARK: Vars & Lets
    var title = ""
    var body = ""

    // MARK: Intialization
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }

}

class NetworkError: Codable {

    let message: String
    let code: Int?

}
