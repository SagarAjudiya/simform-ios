//
//  RefreshTokenViewModel.swift
//  ScientistApp
//
//  Created by Shilpriya Shah on 10/05/21.
//  Copyright © 2021 Simform Solutions Pvt. Ltd.. All rights reserved.
//

import Foundation

class RefreshTokenViewModel {
    
    var isSuccess: Dynamic<Bool> = Dynamic(true)

    func callRefreshToken() {
        let params: [String: Any] = [APIParams.Authentication.refreshToken: userManager.refreshToken]
        APIManager.shared.call(type: .refreshToken, params: params) { [weak self] (result: Swift.Result<SessionModel, CustomError>) in
            guard let uSelf = self else {
                return
            }
            switch result {
            case .success:
                // TODO: save token.
                uSelf.isSuccess.value = true
            case .failure(let error):
                prints(error.body)
                uSelf.isSuccess.value = false
            }
        }
    }
    
}
