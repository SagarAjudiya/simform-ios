//
//  SessionModel.swift
//  ScientistApp
//
//  Created by Shilpriya Shah on 10/05/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class SessionModel: Codable {
    
    var accessToken: String?
    var tokenType: String?
    var refreshToken: String?
    var expiresIn: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "accessToken"
        case tokenType = "tokenType"
        case refreshToken = "refreshToken"
        case expiresIn = "expiresIn"
    }

}
