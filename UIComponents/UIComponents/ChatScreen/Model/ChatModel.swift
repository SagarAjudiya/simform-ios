//
//  Chat.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 31/05/23.
//

import UIKit

struct ChatModel {
    
    let image: UIImage?
    let text: String
    let time: TimeInterval
    let messenger: Messenger
    
    init(image: UIImage? = nil, text: String, time: TimeInterval, messenger: Messenger) {
        self.image = image
        self.text = text
        self.time = time
        self.messenger = messenger
    }
    
    static var data = [
        ChatModel(image: UIImage(named: Image.imgprofile), text: "Here is a photo!", time: 1685537037, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgprofile2), text: "Lorem ipsum dolore!", time: 1685526706, messenger: .receiver),
        ChatModel(image: UIImage(named: Image.imgprofile), text: "Sunny today!", time: 1685537037, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgprofile), text: "Sunny today!", time: 1685537037, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgprofile2), text: "Lorem ipsum dolore!", time: 1685526706, messenger: .receiver),
        ChatModel(image: UIImage(named: Image.imgprofile), text: "Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor.", time: 1685537037, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgprofile2), text: "Lorem ipsum dolore!", time: 1685526706, messenger: .receiver),
        ChatModel(image: UIImage(named: Image.imgprofile2), text: "Nostrud exercitation ullamco laboris nisi ut aliquip ex ea com modo consequat.", time: 1685526706, messenger: .receiver),
    ]
    
    
}
