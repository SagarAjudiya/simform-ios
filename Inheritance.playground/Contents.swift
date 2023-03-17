import UIKit

class Animal {
    var name: String
    
    init(name: String = "Dog") {
        self.name = name
        
    }
    
    func eat() {
        print("Animal can eat")
    }
}

let animal = Animal()
animal.name

class Dog: Animal {
    func display() {
        print("My name is", name)
    }
    
    override func eat() {
        super.eat()
        print("Dog eat food")
    }
}

var labrador = Dog()
labrador.name = "Tommy"
labrador.eat()
labrador.display()


class Regularpolygon {
    func calculatePerimeter(length: Int, sides: Int) {
        var result = length * sides
        print("Perimeter:", result)
    }
}

class RegularSquare: Regularpolygon {
    var length = 0
    var sides = 0
    
    func calculateArea() {
        var area = length * length
        print("Regular Square Area:",area)
    }
}

class RegularTriangle: Regularpolygon {
    var length = 0.0
    var sides = 0.0
    
    func calculateArea() {
        var area = (sqrt(3)/4) * (length * length)
        print("Regular triangle area:",area)
    }
}

var shape = RegularSquare()
shape.length = 4
shape.calculateArea()
shape.calculatePerimeter(length: 3, sides: 4)

var shape2 = RegularTriangle()
shape2.length = 2
shape2.calculateArea()
shape2.calculatePerimeter(length: 2, sides: 3)

class Vehical {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        print("Vehical's noise")
    }
    
}

let someVehical = Vehical()
print(someVehical.description)

// inherit vehical class
class Bicycle: Vehical {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print(bicycle.currentSpeed)
print(bicycle.description)

// inherit bicycle class
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentSpeed = 22.0
tandem.currentNumberOfPassengers = 2
print(tandem.description)


//override
class Train: Vehical {
    override func makeNoise() {
         print("Train's noise")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehical {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()


print(car.gear)
print(car.description)

car.gear = 4
car.currentSpeed = 60
print(car.description)


class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.gear = 10
print(automatic.gear)

automatic.currentSpeed = 35
print(automatic.gear)
print(automatic.description)


// preventing overrides

//  final -> prevent method, property or subscript from being ovrridden

// override final keyword make compile time error
// Methods, properties, or subscripts that you add to a class in an extension can also be marked as final within the extension’s definition.

// mark entire class as mark final keyword before class keyword
// attempt to subclass a final class report as compile time error
