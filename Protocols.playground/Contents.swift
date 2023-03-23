import UIKit

protocol FullyNamed {
    var fullName: String { get }
}

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? (prefix ?? "") + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)


// method
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 19573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
generator.random()
generator.random()


// mutating
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()


// initializers

// we can provide init in the protocol
// we have to writer required before use in any type


// protocol as type
// as a parameter, return type in function, mrthod or init
// type of constant, variable or property
// type of items in array, dictionary

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
 
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}


// Delegation

// design pattern that enables a class or struct to handoff (or delegate) some of its responsibilities to an instance of another type

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(gam: DiceGame)
}

class SnacksAndLadders: DiceGame {
    let finalSquare = 25
    var dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int] = []
    
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    weak var delegate: DiceGameDelegate?
    
    func play() {
        square = 0
        delegate?.gameDidStart(game: self)
        
    gameLoop: while square != finalSquare {
        let diceRoll = dice.roll()
        delegate?.game(game: self, didStartNewTurnWithDiceRoll: diceRoll)
        
        switch square + diceRoll {
        case finalSquare:
            break gameLoop
        case let newSquare where newSquare > finalSquare:
            continue gameLoop
        default:
            square += diceRoll
            square += board[square]
        }
    }
        delegate?.gameDidEnd(gam: self)
    }
    
    deinit {
        print("SnacksAndLadder is deinit")
    }
    
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        
        if game is SnacksAndLadders {
            print("Started a new game")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(gam: DiceGame) {
        print("The game lasted for \(numberOfTurns)")
    }
    
    deinit {
        print("DiceGameTracker is deinit")
    }
}


var tracker: DiceGameTracker = DiceGameTracker()
var game: SnacksAndLadders = SnacksAndLadders()
game.delegate = tracker
game.play()

//tracker = nil
//game = nil


// adding protocol with extension

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
    
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)


// conditionally conforming to a protocol

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map {$0.textualDescription}
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let myDice = [d6, d12]
print(myDice.textualDescription)


// Declaring Protocol Adoption with an Extension

struct Student {
    var name: String
    var textualDescription:  String {
        return "Student name is \(name)"
    }
}

extension Student: TextRepresentable {}

let sagarStudent = Student(name: "Sagar")
let someTextRepresent = sagarStudent.textualDescription


// Adopting a Protocol Using a Synthesized Implementation

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}


enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}

var levels = [SkillLevel.intermediate, SkillLevel.beginner, SkillLevel.expert(stars: 10), SkillLevel.expert(stars: 2)]

for level in levels.sorted() {
    print(level)
}

// collections of protocol type

let things: [TextRepresentable] = [d12, sagarStudent]
for i in things {
    print(i.textualDescription)
}


// protocol inheritance

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnacksAndLadders: PrettyTextRepresentable {
    var textualDescription: String {
        return "!"
    }
    
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)


// Protocol Composition

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy Bithday, \(celebrator.name), you're \(celebrator.age)")
}

let birthdayPerson = Person(name: "Virat", age: 34)
wishHappyBirthday(to: birthdayPerson)


class Location {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Hello, \(location.name)")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
type(of: seattle)
beginConcert(in: seattle)


// checking for protocol conformance

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double {
        return pi * radius * radius
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't ")
    }
}


// optional protocol requirement

// optional protocol and the optional requirement must be marked with the @objc attribute.
//@objc protocols can be adopted only by classes, not by structures or enumerations.

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: CounterDataSource {
    let fixedIncrement = 4
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...4 {
    counter.increment()
    print(counter.count)
}


class TowardsZeroSource: CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()

for _ in 1...5
