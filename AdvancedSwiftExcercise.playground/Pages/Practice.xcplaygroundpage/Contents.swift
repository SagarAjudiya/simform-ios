//: [Previous](@previous)

import Foundation

class First {
    
    var second = Second()
    
    func getData(cls: () -> String) {
        print(cls())
    }
    func printData() {
        var sec = Second()
        sec.showData()
    }
    
}

class Second {
    
    var name = "Sagar"
    var age = 10
    
    func showData() {
        var first = First()
        first.getData(cls: {
            return "\(name) \(age)"
        })
    }
    
}

var sec = Second()
sec.showData()




class One {
    
    var id = 1
    var two = Two()
    
    func printdata() {
        two.cls = { print($0, $1)
            return self.id
        }
    }
    
}

class Two {
    
    var name = "Virat"
    var age = 34
    var cls: ((String, Int) -> Int)?
    
    func passData() {
        print(self.cls?(name, age) ?? 0)
    }
    
}

var one = One()
one.printdata()
one.two.passData()


// data pass delegation
protocol Delegate: AnyObject {
    func passName(name: String)
}


class Car: Delegate {
    
    func passName(name: String) {
        print(name)
    }
    
}

class Bike {
    
    var nameBike = "BMW"
    weak var delegate: Delegate?
    
    func passBike() {
        delegate?.passName(name: nameBike)
    }
    
}

var bike = Bike()
var car = Car()
bike.delegate = car
bike.passBike()


// lay with HOF
let characters = [5, 10, 20]
let new = characters.lazy.map({$0 * 2})
print(new)
new[0]
new[2]


// failable init
class Product {
    
    let name: String
    init?(name: String) {
        if name.isEmpty {return nil}
        self.name = name
    }
    
}

class CartItem: Product {
    var id = 5
    
    let quntity: Int
    init?(name: String, quntity: Int) {
        if quntity < 0 {
            return nil
        }
        self.quntity = quntity
        super.init(name: name)
    }
    
}

extension CartItem {
    
    var nwew: Int {
        get { return id }
        set { id = newValue }
    }
}



// function
func sum(a: Int, b: Int) -> Int {
    return a + b
}

func result(fun: (Int, Int) -> Int, a: Int, b: Int) {
    print(fun(a,b))
}

result(fun: sum, a: 5, b: 5)


