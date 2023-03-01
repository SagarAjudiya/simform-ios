import UIKit

// Class

//Create a swift program to demonstrate swift class. Which has two variables inside class body. Access (Set its values and get its value.) these variables by creating one instance of class.

class MyClass {
    
    var firstName = "Sagar"
    var lastName = "Ajudiya"
}

var myClass = MyClass()
myClass.firstName = "Rajan"
myClass.lastName = "Patel"

print(myClass.firstName)
print(myClass.lastName)

//•    Create a swift program to demonstrate usage of swift class for usage of multiple initializers. Create one initializer with two parameters your name and college and another initializer with your name and department. You can be able to access these properties using instance of class.

class Info {
    
    var name: String
    var college: String
    var department: String
    
    init(name: String, college: String) {
        self.name = name
        self.college = college
        self.department = "Computer"
    }
     
    init(name: String, department: String) {
        self.name = name
        self.department = department
        self.college = "GECR"
    }
}

var student1 = Info(name: "Sagar", college: "GECR")
student1.name
student1.college
student1.department

var student2 = Info(name: "Rajan", department: "CE")
student2.name
student2.department
student2.college

//Create a swift class without initializers and access (write, read) its properties using instance of class.

class WithoutInit {
    
    var firstName = "Sagar"
    var company = "Simform"
    var salary = 400000
    
}

var withoutInit = WithoutInit()
withoutInit.firstName
withoutInit.company = "Simform Solutions"
withoutInit.company

//Create a swift class which is having code to return square of given number and access this code using class instance.

class Square {
    
    func square(number: Int) -> Int {
        return number * number
    }
    
}

var squareNumber = Square()
squareNumber.square(number: 2)

//Create a swift class example to show use of swift inheritance. Your base class has some property access this property. In two different child classes and show its usage using the instances of both child classes.

class Bird {
    var name = "Bird"
}

class Sprrow: Bird {
    var sprrowName = "Sprrow"
}

class Crow: Bird {
    var crowName = "Crow"
}

var sprrow = Sprrow()
sprrow.name
sprrow.sprrowName

var crow = Crow()
crow.name
crow.crowName

//Create a swift class example to show use of swift base class which have some implementation inside any method. Now demonstrate usage of overriding that method implementation.

class BaseClass {
    
    func doSomething() {
        print("Method inside BaseClass")
    }
    
}

class ChildClass: BaseClass {
    
    override func doSomething() {
        print("Method inside ChildClass")
    }
    
}

var childClass = ChildClass()
childClass.doSomething()

//Create a swift class with an initializer in a manner that you can create this class using initializing value. And one function which takes int input and returns the power of class instance.
//example:  let instance = Example(value: 5)
//    let result = instance.doPower(power: 3)
//then it should return 5's 3 power (125)

class Power {
    
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
    
    func calPower(num: Int) -> Int {
        var temp = 1
        for _ in 0..<num {
            temp *= number
        }
        return temp
    }
    
}

var power = Power(number: 5)
power.calPower(num: 3)

//Create a swift class example which has a parent class for vehicles, and child classes for two different vehicles e.g. (bike & car). You need to use common properties and method in the parent class and inside child class, there will be some different property which is not common.

class Vehical {
    
    var wheels: Int
    var type: String
    var gears: Int
    
    init(wheels: Int, type: String, gears: Int) {
        self.wheels = wheels
        self.type = type
        self.gears = gears
    }
    
}

class Bike: Vehical {
    
    var isSportBike: Bool
    var price: Int
    
    init(isSportBike: Bool, price: Int) {
        self.isSportBike = isSportBike
        self.price = price
        super.init(wheels: 2, type: "Petrol", gears: 5)
    }
    
}

class Car: Vehical {
    
    var price: Int
    var isAutomate: Bool
    
    init(price: Int, isAutomate: Bool) {
        self.price = price
        self.isAutomate = isAutomate
        super.init(wheels: 4, type: "Diesel", gears: 5)
    }
}

var car = Car(price: 500000, isAutomate: true)
car.gears

//Create a person swift class with person name initializer and create one function to greet that person.
//Example: let person1 = Person(name: Joe)
//  Person1.greet() // This should print “Hello Joe”

class Greet {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func greet() {
        print("Hello \(name)")
    }
    
}

var greet = Greet(name: "Sagar")
greet.greet()

//Create a swift class with some property. And then set its value using initializer of class, then perform below actions.
//let example1 = Example()
//Example1.a = “Hello”
//let example2 = example1
//example2.a = “Hi”
//print(example1.a)
//print(example2.a)
//// Consider ‘a’ as string property of example class.
//--> Check these two print outputs and try to find out the reason for that output.

class Example {
    var a : String = "Default"
}

let example1 = Example()
example1.a = "Hello"

let example2 = example1
example2.a = "Hi"
print(example1.a)
print(example2.a)
// Classes are reference type
