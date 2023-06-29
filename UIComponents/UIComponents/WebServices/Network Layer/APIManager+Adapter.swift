//
//  APIManager+Adapter.swift
//  ScientistApp
//
//  Created by Shilpriya Shah on 10/05/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import UIKit
import Alamofire

class APIManagerAdapter: RequestAdapter {

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var newRequest = urlRequest
        newRequest.setValue("Bearer \(userManager.accessToken)", forHTTPHeaderField: APIParams.Authentication.authorization)
        return newRequest
    }

}
