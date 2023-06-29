//
//  APIManager+FakeDataProvider.swift
//  ScientistApp
//
//  Created by Shilpriya Shah on 10/05/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire
import UIKit
import Reachability

/// Provide fake data to controller
class FakeDataProvider: NetworkManger {
    
    func call<T>(type: RequestItemsType, params: Parameters?, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable {
        handler(.failure(CustomError(title: R.string.localizable.appName(), body: APIError.noData)))
    }
    
}
