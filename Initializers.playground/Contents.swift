import UIKit

class Wall {
    var length: Double
    
    init(){
        print("Create Wall object")
        length = 5
        print("Length \(length)")
    }
}

var wall1 = Wall()

// parameterized initializer
class area {
    var length: Double
    var height: Double = 1.0
    
    init() {
        height = 1.0
        length = 1.0
    }
    
    init(length: Double, height: Double) {
        self.height = height
        self.length = length
    }
    
    init(length: Double) {
        self.length = length
    }

    func calculateAreaRec() -> Double {
        return length * height
    }
    
    func calculateAreaSqu() -> Double {
        return length * length
    }
}

var area1 = area(length: 10, height: 20)
var area2 = area(length: 20, height: 30)
var area3 = area(length: 20)
var area4 = area()
var area5 = area(length: 10)

    
area1.calculateAreaRec()
area2.calculateAreaRec()
area3.calculateAreaRec()
area4.calculateAreaSqu()
area5.calculateAreaSqu()


// default initializer
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
    
    func getListItem() -> Void {
        print("name: \(name ?? ""), quntity: \(quantity), purchased: \(purchased)")
    }
}
var item = ShoppingListItem()
item.getListItem()
 
// initializer overloading
// primary initializer or designated initializer

class Person {
    var age: Int
    
    init() {
        age = 20
    }
    init(age: Int) {
        self.age = age
    }
    
    func getAge() -> Int {
        return age
    }
}

var person1 = Person()
var person2 = Person(age: 23)

person1.getAge()
person2.getAge()


// convenience initializer

// it is useful when it comes assign default value to stored proprties

class University {
    var name: String
    var rank: String
     
    init(name: String, rank: String) {
        self.name = name
        self.rank = rank
    }
    
    convenience init() {
        self.init(name: "GTU", rank: "100")
    }
    
    func getDetails() -> () {
        print("Name: \(name) and raank is \(rank)")
    }
}

var university1 = University()
university1.getDetails()

var university2 = University(name: "ABC", rank: "200")
university2.getDetails()


// failable initializers

class File {
    var folder: String
    
    init?(folder: String) {
        if folder.isEmpty {
            print("folder is not here")
            return nil
        }
        self.folder = folder
    }
}

var file1 = File(folder: "")
if(file1 != nil) {
    print("File is here..")
} else {
    print("Error..")
}


// memberwised initializer for struct

// not reqire to create an ionitializer with struct, swift autogenerates a memberwise for us

struct PersonStruct {
    var name: String
    var age: Int
    
    func getPrValue() -> () {
        print(name, "age is", age)
    }
}

var pr1 = PersonStruct(name: "Bob", age: 66)
pr1.getPrValue()


struct Celsius {
    var temInCelsius: Double
    
    init(fahrenheit: Double) {
        temInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(kelvin: Double) {
        temInCelsius = kelvin - 273.15
    }
}
let cel1 = Celsius(fahrenheit: 10)
cel1.temInCelsius

let cel2 = Celsius(kelvin: 20.0)
cel2.temInCelsius


struct Size1 {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size1(width: 2.0, height: 2.0)
print(twoByTwo.width, twoByTwo.height)

let zeroByTwo = Size1(height: 2.0)
print(zeroByTwo.width, zeroByTwo.height)

let zeroByZero = Size1()
print(zeroByZero.width, zeroByZero.height)

// optional property type

class SurveyQuestion {
    let text: String
    var resonse: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

var survey1 = SurveyQuestion(text: "Do you have a car?")
survey1.ask()
var survey2 = SurveyQuestion(text: "Hi question")
survey2.resonse = "This is answer"
survey2.ask()
survey2.resonse


// initializer delegation for value(structures) types

//Initializers can call other initializers to perform part of an instance’s initialization. This process, known as initializer delegation, avoids duplicating code across multiple initializers.

struct Size {
    var width = 0.0, height = 0.0
}

struct Point  {
    var x = 0.0, y = 0.0
}

struct Rect {
    var size = Size()
    var origin = Point()
    
    init() {}
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
print(basicRect.origin, basicRect.size)

let originRect = Rect(origin: Point(x: 2, y: 2), size: Size(width: 5, height: 5))
print(originRect.origin, originRect.size)

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
print(centerRect.origin, centerRect.size)


// class inheritance and initialization

//All of a class’s stored properties — including any properties the class inherits from its superclass — must be assigned an initial value during initialization.

//Swift defines two kinds of initializers for class types to help ensure all stored properties receive an initial value. These are known as designated initializers and convenience initializers.

//init(<#parameters#>) {
//   <#statements#>
//}

//convenience init(<#parameters#>) {
//   <#statements#>
//}


// initializer delegation for class type

//Rule 1
//A designated initializer must call a designated initializer from its immediate superclass.
//
//Rule 2
//A convenience initializer must call another initializer from the same class.
//
//Rule 3
//A convenience initializer must ultimately call a designated initializer.


// two phase initialization

//Swift’s two-phase initialization process is similar to initialization in Objective-C. The main difference is that during phase 1, Objective-C assigns zero or null values (such as 0 or nil) to every property. Swift’s initialization flow is more flexible in that it lets you set custom initial values, and can cope with types for which 0 or nil isn’t a valid default value.


// initializer inheritance and overriding

class Vehical {
    var numOfWheels = 0
    var description: String {
        return "\(numOfWheels) wheels"
    }
}

let vehical1 = Vehical()
vehical1.description

class Bicycle: Vehical {
    override init() {
        super.init()
        numOfWheels = 2
    }
}

let bicycle1 = Bicycle()
bicycle1.description

class HoverBoard: Vehical {
    var color: String
    
    init(color: String) {
        self.color = color
        
        // super.init() called bt default
    }
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard1 = HoverBoard(color: "Golden")
hoverboard1.color
hoverboard1.description


// designated and convenience initializers

class Food {
    var name: String
    
    init(name: String) {
        print(4)
        self.name = name
    }
    convenience init() {
        print(1)
        self.init(name: "[Unnmaed]")
    }
}

let foodName1 = Food(name: "Bacon")
foodName1.name

let foodName2 = Food()
foodName2.name


class RecipeIngredient: Food {
    var quntity: Int
    
    init(name: String, quntity: Int) {
        print(3)
        self.quntity = quntity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        print(2)
        self.init(name: name, quntity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
oneMysteryItem.name
oneMysteryItem.quntity

let oneBacon = RecipeIngredient(name: "Bacon")
oneBacon.name
oneMysteryItem.quntity

let sixEggs = RecipeIngredient(name: "Eggs", quntity: 6)
sixEggs.name
sixEggs.quntity


class ShoppingListItems: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quntity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItems(),
    ShoppingListItems(name: "Bacon"),
    ShoppingListItems(name: "Eggs", quntity: 6),
]

breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true

for i in breakfastList {
    print(i.description)
}


// failable initializers

let wholeNumber: Double = 12345.0
let pi = 3.1415

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}

let valueChanged = Int(exactly: pi)

if valueChanged == nil {
    print("\(pi) conversion to Int doesn't maintain value \(valueChanged)")
}

struct Animal {
    let species: String
    init?(species: String){
        if species.isEmpty { return nil}
        self.species = species
    }
}

let someAnimal = Animal(species: "Monkey")
someAnimal?.species
type(of: someAnimal)

if let monkey = someAnimal {
    print("An animal was initialized with a species of \(monkey.species)")
}

let emptyAnimal = Animal(species: "")
emptyAnimal?.species
type(of: emptyAnimal)


// failable initlizers for enum

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character){
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "C")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
} else {
    print("Invalid input")
}


// failable initialization for enum with raw value

enum TemperatureUnit1: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fahUnit = TemperatureUnit1(rawValue: "f")
if fahUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
} else {
    print("Unknown Input found")
}


// propagation of initialization failure

class Product {
    let name: String
    
    init?(name: String) {
        if name.isEmpty {return nil}
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    
    init?(name: String, quantity: Int) {
        if quantity < 1 {
            return nil
        }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "Sock`", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}


// overriding a failable initializers

class Document {
    var name: String?
    
    init() {}
    
    init?(name: String) {
        if name.isEmpty { return nil}
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

// init! failable initializer

//You can delegate from init? to init! and vice versa, and you can override init? with init! and vice versa. You can also delegate from init to init!, although doing so will trigger an assertion if the init! initializer causes initialization to fail.


// required initializers

class SomeClass1 {
    required init (msg: String) {
        print(msg)
    }
}

class SomeSubClass1: SomeClass1 {
    required init(msg: String) {
        print("someSubClass1")
        super.init(msg: msg)
    }
}

var obj = SomeSubClass1(msg: "Sagar")


class classA {
    required init() {
        var a = 10
        print(a)
    }
}
class classB: classA {
    required init() {
        var b = 30
        print(b)
    }
}

let objA = classA()
let objB = classB()


// setting default property value with a closure or function

// default property value
class SomeClass {
    let someProperty: String = {
        return ""
    }()
}

struct ChessBoard {
    let boardColors: [Bool] = {
        var temporaryBoard: [Bool] = []
        var isBlack = false
        
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }

}

let board = ChessBoard()
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))

