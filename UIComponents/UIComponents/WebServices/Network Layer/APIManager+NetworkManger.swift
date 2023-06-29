//
//  APIManager+NetworkManger.swift
//  ScientistApp
//
//  Created by Shilpriya Shah on 10/05/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Alamofire
import UIKit
import Reachability

/// Network Manger call the register data provide calls data provider methods
protocol NetworkManger {
    
    func call<T>(type: RequestItemsType, params: Parameters?, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable
}
