import UIKit

class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    func increment(by amount: Int) -> Void {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
print(counter.count)

counter.increment(by: 5)
print(counter.count)

counter.reset()
print(counter.count)


// modifying value types from within instance method

//--> struct and enum are value type, the property of value type can't be mofified from within its instance method

struct Point {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveBy(x: 2.0, y: 3.0)

print("The point is now at (\(somePoint.x), \(somePoint.y))")

let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)    // this will report an error


// assign self with mutating method

struct Point1 {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point1(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint1 = Point1(x: 1.0, y: 1.0)
somePoint1.moveBy(x: 5.0, y: 6.0)

print("The point is now at (\(somePoint1.x), \(somePoint1.y))")


enum TriStateSwitch {
    case off, low, high
    
    mutating func next() {
        switch self {
        case.off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low

ovenLight.next()
ovenLight.next()
ovenLight.next()


// type methods

// type methods by static & classes can use class

class SomeClass {
    class func someTypeMethod() {
        
    }
}

SomeClass.someTypeMethod()


struct Leveltracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    mutating func advance(level: Int) -> Bool {
        if Leveltracker.isUnlocked(level: level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = Leveltracker()
    let playerName: String
    
    init(name: String) {
        playerName = name
    }
    
    func complete(level: Int) {
        Leveltracker.unlock(level: level + 1)
        tracker.advance(level: level + 1)
    }
}

var player = Player(name: "Sagar")
player.complete(level: 1)
Leveltracker.highestUnlockedLevel

player = Player(name: "Priyanshu")
if player.tracker.advance(level: 6) {
    print("Player is now on level 6")
} else {
    print("level 6 hasn't unlocked")
}
player.playerName
player.tracker.currentLevel


//Static Functions

//Can be associated with a class, struct, or enum.
//Defined by static keyword.
//Can not be overridden in the subclass.
//Can not access self properties


//Class Functions

//Can be associated with class only.
//Defined by class keyword.
//Can be overridden in the subclass.
//Can access self properties


// self property

class Marks {
  var physics = 0

  func checkEligibility(physics: Int) {

    if (self.physics < physics) {
      print("Not Eligible for admission")
    } else {
      print("Eligible for admission")
    }
  }
}

var student1 = Marks()
student1.physics = 28
student1.checkEligibility(physics: 50)


