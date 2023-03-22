import UIKit

//Add functionality to an existing type.
// class, struct, enum, protocol

// Extensions can add new functionality to a type, but they can’t override existing functionality.

//If you define an extension to add new functionality to an existing type, the new functionality will be available on all existing instances of that type, even if they were created before the extension was defined.

// computed properties

extension Double {
    var km: Double { return self * 1_000.0}
    var m: Double { return self}
    var cm: Double { return self / 100.0}
    var mm: Double { return self / 1_000.0}
    var ft: Double { return self / 3.28084}
}

let oneInch = 25.4.mm
print(oneInch, "meters")

let threeFeet = 3.ft
print(threeFeet, "metters")

let marathon = 42.km + 195.m
print(marathon, "meters")

//Extensions can add new computed properties, but they can’t add stored properties, or add property observers to existing properties.


// initializers

// Extensions can add new convenience init to class, but can't add new designated init or deinit in class
// designated init and deinit must be provided by original class

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwisedRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))


// Methods
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello")
}


// mutating instance method
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()


// subscript
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

4325464[0]
4325464[1]
4325464[2]


// nested types
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("-", terminator: "")
        case .zero:
            print("0", terminator: "")
        case .positive:
            print("+", terminator: "")
        }
    }
    print("")
}

printIntegerKinds(numbers: [3, 19, -27, 0, -6, 0, 7])
