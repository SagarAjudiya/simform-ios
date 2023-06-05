//
//  GolfModel.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 05/06/23.
//

import UIKit

struct GolfUser {

    let imgProfile: UIImage?
    let name: String
    let phone: String
    let amount: String
    let isSelect: Bool
    
}

struct GolfModel {
    
    let groupName: String
    let viewScore: Bool
    let selectAll: Bool
    var user: [GolfUser]
    
    static let data = [
        GolfModel(groupName: "Group One", viewScore: false, selectAll: false, user: [
            GolfUser(imgProfile: UIImage(named: Image.user1), name: "You", phone: "+1 461 997 5642", amount: "$11.00", isSelect: false),
            GolfUser(imgProfile: UIImage(named: Image.user1), name: "Gail Forcewind", phone: "+1 461 997 5642", amount: "$22.00", isSelect: false),
            GolfUser(imgProfile: UIImage(named: Image.user1), name: "Mario Spewagon", phone: "+1 461 997 5642", amount: "$8.00", isSelect: false),
            GolfUser(imgProfile: UIImage(named: Image.user1), name: "Anna Asthenia", phone: "+1 461 997 5642", amount: "$3.00", isSelect: false),
        ]),
        GolfModel(groupName: "Group Two", viewScore: false, selectAll: false, user: [
            GolfUser(imgProfile: UIImage(named: Image.user1), name: "You", phone: "+1 461 997 5642", amount: "$11.00", isSelect: false),
            GolfUser(imgProfile: UIImage(named: Image.user1), name: "Gail Forcewind", phone: "+1 461 997 5642", amount: "$22.00", isSelect: false),
            GolfUser(imgProfile: UIImage(named: Image.user1), name: "Mario Spewagon", phone: "+1 461 997 5642", amount: "$8.00", isSelect: false),
            GolfUser(imgProfile: UIImage(named: Image.user1), name: "Anna Asthenia", phone: "+1 461 997 5642", amount: "$3.00", isSelect: false),
        ]),
    ]
    
}
