import UIKit

// Access Specifiers

// public
class Animal {
    public var legCount = 0
    
    public func display() {
        print("I am Animal")
        print("TOtal legs", legCount)
    }
}

var animal = Animal()
animal.legCount = 4
animal.display()

// private
class Student1 {
    private var name = "Virat Kohli"
    
    private func display() {
        print("This is from Student1 class")
    }
}

var student1 = Student1()
//print(student1.name) // error because private
//student1.display() // error because private

// fileprivate
class Student {
    fileprivate var name = "Rohit Sharma"
    
    fileprivate func display() {
        print("This from Student Class")
    }
}

var student = Student()
print(student.name)
student.display()

// internal
class Cricketer {
    internal var name = "Rahul"
}

var cricketer = Cricketer()
cricketer.name
 
// final in global

//static var name = "Sagar"
//final var name = "Sagar"

// convenience
struct StudentList {
    var rollNumber: Int
    var name: String
    lazy var uniqueId: String = {"ID_\(name)_\(rollNumber)"}()
    
    init(rollNumber: Int, name: String) {
        self.rollNumber = rollNumber
        self.name = name
    }
}

var sagar = StudentList(rollNumber: 1, name: "Sagar")
print(sagar.uniqueId)

// we can't use convenience init in struct
// if we provide custom init in struct then memberwised init isn't used by struct

enum NewEnum {
    case caseA(String)
    case caseB(Int)

    
    init?(value: Any) {
        switch value {
        case let str as String:
            self = .caseA(str)
        case let num as Int:
            self = .caseB(num)
        default:
            print("Default")
            return nil
        }
    }
}
    
let a = NewEnum(value: 0.0)
a.self

// we can't use convenience init in enum
// if we provide custom init in enum then memberwised init isn't used by enum

// failable
struct Video {
    let position: TimeInterval
    let duration: TimeInterval
    
    var progress: Float {
        Float(position / duration)
    }
    
    init?(position: TimeInterval, duration: TimeInterval) {
        self.position = position
        self.duration = duration
    }
}

let video = Video(position: 100, duration: 100)
print(video?.duration ?? 0)

enum MyEnum {
    case success(String)
    case failure(String)
    
    init?(value: String) {
        if value.isEmpty {
            return nil
        } else if value.contains("success") {
            self = .success(value)
        } else {
            self = .failure(value)
        }
    }
}

var myEnum = MyEnum(value: "success")
myEnum.self

// global variable and method memory and deinit

// lazy only with variable declare with var


// static vs class
class Person {
    static var count: Int {
        return 250
    }
    class var averageAge: Double {
        return 30
    }
}

class studentPerson: Person {
    override class var averageAge: Double {
        return 150
    }
}

//static can't be override in subclass, use with class, struct, enum
//class cant be override in subclass, use only with clsas


// final

// we can't inherit final class


// mutating func

struct Details {
    var firstName = "Virat"
    var lastName = "Kohli"
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
    mutating func capitalName() {
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

var details = Details()
details.fullName()
details.capitalName()
details.fullName()

enum Marks: Int {
    case eng = 30, phy = 55, maths = 63
    
    mutating func chageMarks() {
        self = .eng
    }
}

var marks = Marks.phy
marks.chageMarks()
print(marks)


enum Fruit {
    case apple(Int)
    case banana(Int, Int, Int)
    
    mutating func increment() {
        switch self {
        case let .apple(x):
            self = .apple(x + 1)
        case let .banana(x, y, z):
            self = .banana(x + 1, y, z)
        }
    }
}

var fruit = Fruit.banana(10, 1, 2)
fruit.increment()


// capturing list in closure
class Singer {
    func playSong() {
        print("In class")
        print("Shake it off")
        print("out class---")
    }
    
    init(){
        print("singer is initialized")
    }
    
    deinit{
        print("deinit in class")
    }
}

func sing(singer: Singer?) -> () -> Void {
    print("In function")
    
    let singing = { [weak singer] in
        print("In closure")
        singer?.playSong()
        print("out closure---")
    }
    print("out function---")
    return singing
}

var singerObject: Singer? = Singer()
var closure = sing(singer: singerObject)
print(closure)

singerObject = nil


struct MySinger {
    var name: String
    var salary: Int
    
    let greet = {
        print("Closure inside Enum")
    }
}

let mySinger = MySinger(name: "Sagar", salary: 100)
mySinger.greet()



struct Rectangle {
    var width = 0.0
    var height = 0.0

    var area: Double {
        get {
            print("get is called")
            return width * height
        }
        set {
            print("Set is called")
            self.height = sqrt(newValue)
            self.width = sqrt(newValue)
        }
    }
}

var rec = Rectangle()
rec.area

rec.area = 120

rec.height
rec.width
rec.area

class Sumation {
    var a = 0
    var sum: Int {
        get {
            print(a)
//            return sum // recurcive
            return a
        }
        set {
//            print()
            print(newValue)
        }
    }
    init() {
        a = 25
    }
}

var c = Sumation()
print(c.sum)
c.sum = 20
print(c.sum)


class Age {
    var age = 15
}
var ageObj = Age()


var closureOfAge = { [ageObj] in
    print("Inside closure")
    print(ageObj.age)
    print("Outside closure")
}

ageObj.age = 20

closureOfAge()




























//

//class A {
//    lazy var name: String
//
//    deinit {
//        print("A denit")
//    }
//}
//
//class B: A {
//
//    func printName() {
//        print(name = "Sagar")
//    }
//
//    deinit {
//        Swift.print("B init")
//    }
//}
//
//var b = B.printName()



//
//var sum: () {
//    get {
//        print("Get called")
//    }
//    set {
//        print("Set called")
//    }
//}
//sum = 5

