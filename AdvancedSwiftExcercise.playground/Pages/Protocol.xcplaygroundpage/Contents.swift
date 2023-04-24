//: [Previous](@previous)

import Foundation

protocol DataPassingDelegate: AnyObject {
    func namePass(name: String)
}

class First: DataPassingDelegate {
    
    func namePass(name: String) {
        print(name)
    }
    
}

class Second {
    
    var name = "Sagar"
    weak var delegate: DataPassingDelegate?
    
    func myFunction() {
        delegate?.namePass(name: name)
    }
    
}

var second = Second()
var first = First()
second.delegate = first
second.myFunction()
