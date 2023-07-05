//
//  Chat.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 31/05/23.
//

import UIKit

struct ChatModel {
    
    let image: UIImage?
    let textMessage: MessageType
    let time: TimeInterval
    let messenger: Messenger
    
    init(image: UIImage?, textMessage: MessageType, time: TimeInterval, messenger: Messenger) {
        self.image = image
        self.textMessage = textMessage
        self.time = time
        self.messenger = messenger
    }
    
    static var data = [
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .text("Lorem exercitation ullamco laboris nisi ut aliquip ex ea com modo consequat."), time: 1685625164, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .text("Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."), time: 1685632274, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .text("Hi, How are you?"), time: 1685664000, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgReceiver), textMessage: .text("Here is a photo!"), time: 1685877030, messenger: .receiver),
        ChatModel(image: UIImage(named: Image.imgReceiver), textMessage: .image(UIImage(named: Image.imgReceiver)), time: 1685750399, messenger: .receiver),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .image(UIImage(named: Image.imgSender)), time: 1685614316, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgReceiver), textMessage: .text("Receiver side"), time: 1685632497, messenger: .receiver),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .text("Here is a photo!"), time: 1685632517, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .image(UIImage(named: Image.imgSender)), time: 1685963350, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .text("Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."), time: 1685632274, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .text("Hi, How are you?"), time: 1685664000, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgReceiver), textMessage: .text("Here is a photo!"), time: 1685877030, messenger: .receiver),
        ChatModel(image: UIImage(named: Image.imgReceiver), textMessage: .image(UIImage(named: Image.imgReceiver)), time: 1685750399, messenger: .receiver),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .image(UIImage(named: Image.imgSender)), time: 1685614316, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgReceiver), textMessage: .image(UIImage(named: Image.chatBack)), time: 1685617916, messenger: .receiver),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .text("Lorem ipsum dolore!"), time: 1685625164, messenger: .sender),
        ChatModel(image: UIImage(named: Image.imgSender), textMessage: .text("Exercitation ullamco laboris nisi ut aliquip ex ea com modo consequat."), time: 1685625116, messenger: .sender),
    ]
    
}
