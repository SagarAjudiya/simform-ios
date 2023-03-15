import UIKit

// no parameter and no return type
var greet = { print("Good morning..!") }
greet()


// parameter closure
let greetUser = { (name: String) in
    print("Hi, \(name)")
}
greetUser("Sagar")

let birthDay = { (name: String) in
    print("Happy Birthday \(name)")
}
birthDay("Sagar")

let birthday:(String?) -> () = {
    print("Happy birthday, \($0 ?? "Bob")!")
}
birthday(nil)


// closure with return value
var findSquare = { (num: Int) -> Int in
    var square = num * num
    return square
}

var findCube = { (num: Int) -> Int in
    var cube = num * num * num
    return cube
}

var resultSquare = findSquare(5)
print(resultSquare)

var resultCube = findCube(2)
print(resultCube)


// Closure with function parameter
func grabLunch(search: ()->()) {
    print("Lunch Break")
    
    search()
}

grabLunch(search: {
    print("Pizza")
})


// Trailing closure
func takeLunch(message: String, search: () -> ()) {
//    print(message)
    search()
    print(message)
}

takeLunch(message: "Take Lunch", search: {
    print("Closure Lunch")
})


// Autocloser
func display(greet: @autoclosure () -> ()) {
    greet()
}

display(greet: print("Autoclosure"))


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

var reversedName = names.sorted {(s1: String, s2: String) -> Bool in
    return s1 > s2
}
    
// Inferring Type From Context
reversedName = names.sorted(by: { s1, s2 in return s1 > s2 } )
print(reversedName)

// Implicit Returns from Single-Expression Closures
reversedName = names.sorted(by: { s1, s2 in s1 > s2 } )
print(reversedName)

// Shorthand Argument Names
reversedName = names.sorted(by: { $0 > $1 } )
print(reversedName)

// Operator method
reversedName = names.sorted(by: <)
print(reversedName)



let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}


//Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementor() -> Int {
        runningTotal += amount
        print(runningTotal)
        return runningTotal
    }
    return incrementor
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

incrementByTen()


// closure are reference type

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

incrementByTen()


let squared = { $0 * $0 }(12)
print(squared)


func addScore(_ points: Int) -> Int {
    let score = 42
    let calculate = {
        return score + points
    }
    
    return calculate()
}

let value = addScore(11)
print(value)


// 13 march task
class FirstClass {
    func callSecond() {
        var sec = SecondClass()
        var data = sec.returnData()
        print(data("Sagar", 22))
    }
}

class SecondClass {
    var name = "Sagar"
    var age = 22
    
    var data = {(name: String, age: Int) -> String in
        return "Name \(name), Age \(age)"
    }

    
    func returnData() -> (String, Int) -> String {
        return data
    }
}

FirstClass().callSecond()

// escaping closures
//class TaskManager{
//    var onTaskFinished:(() -> Void)?
//
//    func startLengthyTask(completionHandler: @escaping () -> Void)
//    {
//        // Store completion handler for later
//        onTaskFinished = completionHandler
//
//        // Do lengthy task
//        // …
//    }
//
//    func onLengthyTaskFinished() {
//        onTaskFinished?() // Call completion handler
//    }
//}
//
//let task = TaskManager()
//task.startLengthyTask(completionHandler: {
//    // Do this when task has finished…
//})


//let handle = FileHandle.standardInput
//for try await line in handle.bytes.lines {
//    print(line)
//}

actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}
//let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
//print(await logger.max)

// non-escaping
func calculateSum(array: [Int], performSum: ((Int) -> Void)) {
    var sum = 0
    for i in array {
        sum = sum + i
    }
    performSum(sum)
}

func calculation() {
    var array = [0,1,2,3,4,5,6,7,8,9]
    calculateSum(array: array, performSum: { sum in
        debugPrint(sum)
    })
}

// escaping
var complitionHandler: ((Int) -> Void)?
var sum = 0

func calculateSumEs(array: [Int], performSum: @escaping ((Int) -> Void)) {
    for i in array {
        sum = sum + i
    }
    complitionHandler = performSum
}

func calculationEs() {
    sum = 0
    var array = [0,1,2,3,4,5,6,7,8,9]
    calculateSumEs(array: array, performSum: {sum in
        debugPrint(sum)
    })
}
calculation()
complitionHandler?(sum)


// ARC

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil


class Person1 {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitiaized")
    }
}


class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person1?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: Person1?
var unit4A: Apartment?

john = Person1(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

// unowned

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: Int
    unowned let customer: Customer
    init(number: Int, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card \(number) is being deinitialized")
    }
}

var john1: Customer?

john1 = Customer(name: "John1")
john1?.card = CreditCard(number: 123, customer: john1!)

john1 = nil

// unowned

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "India", capitalName: "New Delhi")
print("\(country.name)'s capital city is \(country.capitalCity.name)")


// Strong reference cycle for closures

class HTMLElement {

    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }

}

let heading = HTMLElement(name: "h1")
let defaultText = "Some Default Text"

heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello World")
print(paragraph?.asHTML() ?? "")
 

// resolving strong reference for closure

class HTMLElement1 {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit{
        print("\(name) is being deinitialized")
    }
    
}

var para: HTMLElement1 = HTMLElement1(name: "p", text: "Hello, world")
print(paragraph!.asHTML())

//para = nil


class First {
    
    func printSecond() {
        var second = Second()
        print("1")
        second.some()
    }
    func returnData( _ closure: () -> String){
        print("3")
        print(closure())
    }
    deinit {
        print("First Deinitialized!")
    }
}



class Second {
    var name: String = "PD"
    var age = 20
    
    func some() {
        let first = First()
        print("2")
        first.returnData({
            return "\(self.name)\(self.age)"
        })
        print("4")
    }

}

var firstObject = First()
firstObject.printSecond()



// closure backward data parsing
class List {
    func printDetail() {
        var detail = Detail()
        detail.someData()
    }
    
    func returnData(closure: () -> String) {
        print(closure())
    }
}

class Detail {
    var name: String = "Sagar"
    var age: Int = 20
    
    func someData() {
        var list = List()
        list.returnData(closure: {
            return "Name is \(name) and age is \(age)"
        })
    }
}

var list = List()
list.printDetail()
