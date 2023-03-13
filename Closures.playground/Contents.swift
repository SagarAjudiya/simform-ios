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
class First {
    func callSecond() {
        var sec = Second()
        var data = sec.returnData()
        print(data("Sagar", 22))
    }
}

class Second {
    var name = "Sagar"
    var age = 22
    
    var data = {(name: String, age: Int) -> String in
        return "Name \(name), Age \(age)"
    }

    
    func returnData() -> (String, Int) -> String {
        return data
    }
}

First().callSecond()
