//
//  NetworkManger.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 03/07/23.
//

import Foundation
import Alamofire

protocol NetworkManger {
    
    func call<T>(type: RequestItemsType, params: Parameters?, handler: @escaping (Swift.Result<T, CustomError>) -> Void) where T: Codable
    
}
