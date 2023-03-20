import UIKit

// Stored properties

//  These properties we defined above are also called stored properties as they store actual values for each instance of the Person class.

class Person {
 // define two properties
 var name: String = ""
 var age: Int = 0
}

var person1 = Person()

// assign values to properties
person1.name = "Kevin"
person1.age = 42

print("Name:", person1.name)
print("Age:", person1.age)


struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6  // error -> because struct is value type

// This is true for class because class are reference type


// lazy stored properties

 // initial value isn't calcuylated until it's first time use
 // always use with var

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property hasn't yet been created

print(manager.importer.fileName)
// the DataImporter instance for the importer property has now been created


// Computed properties

// computed propeties calculate the values {...}

class Calculator1 {
    var num1: Int = 0  // stored
    var num2: Int = 0  // stored
    
    var sum: Int {  // computed
        num1 + num2
    }
}

var obj1 = Calculator1()
obj1.num1 = 11
obj1.num2 = 12

print("Sum is", obj1.sum)


// getter - returns computed properties
// setter - changes the value

class Calculator {
    var num1: Int = 0
    var num2: Int = 0
    
    var sum: Int {
        get {
            num1 + num2
        }
        
        set(modify) {
            num1 = (modify + 10)
            num2 = (modify + 20)
        }
    }
    
}

var obj = Calculator()
obj.num1 = 20
obj.num2 = 50

print("Get value", obj.sum)

obj.sum = 5

print("New num1",obj.num1)
print("New num2",obj.num2)


struct Point {
    var x = 0.0, y = 0.0
}

struct Size1 {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size1()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size1(width: 10.0, height: 10.0))

let initialSquare = square.center
square.center = Point(x: 15.0, y: 15.0)

print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


// shorthand setter
struct AlternativeRect {
    var origin = Point()
    var size = Size1()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


// shorthand getter
struct CompactRect {
    var origin = Point()
    var size = Size1()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}


// read only computed proprties

// property with getter but no setter, always returns a value
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


// property observer

// willSet -> called before value stored
// didSet -> called after new value stored

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("willSet About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("didSet Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896


// property wrapperes

@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get {return number}
        set {number = min(newValue, 12)}
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)


// setting initial value for wrapped properteis

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number}
        set { number = min(newValue, maximum)}
    }
    
    init() {
        maximum = 12
        number = 0
    }
    
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}

var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)

struct NarrowRectangle {
    @SmallNumber (wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber (wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.width)
print(mixedRectangle.height)

mixedRectangle.height = 20
print(mixedRectangle.height)


// projecting value from property wrapper

@propertyWrapper
struct SmallNumberOne {
    private var number: Int
    private(set) var projectedValue: Bool
    
    var wrappedValue: Int {
        get {return number}
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
    
    init() {
        self.number = 0
        self.projectedValue = false
    }
}

struct SomeStructureOne {
    @SmallNumberOne var someNumber: Int
}

var someStructure = SomeStructureOne()

someStructure.someNumber = 4
print(someStructure.$someNumber)

someStructure.someNumber = 55
print(someStructure.$someNumber)


enum Size {
    case small, large
}

struct SizedRectangle {
    @SmallNumberOne var height: Int
    @SmallNumberOne var width: Int

    mutating func resize(to size: Size) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}


// global and local varialbles

func someFunction() {
    @SmallNumberOne var myNumber: Int
    
    myNumber = 10
    print(myNumber)
    
    myNumber = 24
    print(myNumber)
}
someFunction()


// type properties

// belongs to an instance of particular type

struct SomeStructure {
    static var storedTypeProperty = "Some value struct."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value enum."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value class."
    static var computedTypeProperty: Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "another value struct"
print(SomeStructure.storedTypeProperty)

print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)


struct AudioChannel {
    static let thresoldlevel = 10
    static var maxInputLevelForAllChannels = 0
    
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresoldlevel {
                currentLevel = AudioChannel.thresoldlevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)

AudioChannel.maxInputLevelForAllChannels

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)

AudioChannel.maxInputLevelForAllChannels


// static properties

//create properties that can be accessed and modified without creating objects.

class University {
    static var name: String = ""
    var founded: Int = 0
}

var uniObj = University()

University.name = "GTU"
print(University.name)

uniObj.founded = 1999
//print(uniObj.name) Error
print(uniObj.founded)

//we can also create static properties inside a struct. static properties inside a struct are of a struct type, so we use the struct name to access them.
