import UIKit

// function calling and syntax
func studentName(name: String) -> String {
    return name
}
studentName(name: "Sagar")
studentName(name: "Priyanshu")


// parameter and return value
func divison(num1: Double, num2: Double) -> Double {
    return num1 / num2
}
divison(num1: 10, num2: 3)


// function without parameter
func greet() {
    print("Have a greate day")
}
greet()


// return multiple value
func largeSmall(array: [Int]) -> (large: Int, small: Int) {
    var large = array[0]
    var small = array[0]
    
    for i in array {
        if i > large {
            large = i
        } else if i < small {
            small = i
        }
    }
    return (large, small)
}

let num = largeSmall(array: [40,12,-5,78,98])
print("Largest number is: \(num.large) and smallest number is: \(num.small)")


// without return values
func returnNum(no1: Int, no2: Int) {
    print("no1 is \(no1) and no2 is \(no2)")
}

returnNum(no1: 10, no2: 20)


// array with optional return type
func minMax(array: [Int]) -> (min:Int, max:Int)? {
    if array.isEmpty { return nil }
    
    var curMin = array[0]
    var curMax = array[0]
    
    for i in array {
        if i < curMin {
            curMin = i
        }
        else if i > curMax {
            curMax = i
        }
    }
    return (curMin, curMax)
}

var a = minMax(array: [8, 2, 109, 3, 71])


// functions local parameter
func sample(num: Int) {
    print(num)
}
sample(num: 55)


// external parameter
func power(first a: Int, powerOf b: Int){
    var res = a
    for _ in 1..<b {
        res = res * a
    }
    print(res)
}
power(first: 5, powerOf: 2)


// variadic parameters
func variadic(members: Any...){
    for i in members {
        print(i)
    }
}

variadic(members: "namer", 20, 54.15, [1, 2, 3, 4])


// inout parameter
func temp(a1: inout Int, b1: inout Int) {
    let t = a1
    a1 = b1
    b1 = t
}
var n1 = 5, n2 = 10
temp(a1: &n1, b1: &n2)
print("Swapped Number \(n1) and \(n2)")


// void function -> won't return anything
func input() {
    print("Swift is Owsmm")
}
input()


// using function type
//var addition : (Int, Int) -> Int = summ

func sum (a:Int, b:Int) -> Int {
    return a + b
}

var addition = sum
type(of: addition)

print(addition(40, 40))
print(sum(a: 10, b: 5))


// function as parameter and return type
func addition(a: Int, b: Int) -> Int{
    return a + b
}

func another(sum: (Int, Int) -> Int, a:Int, b:Int){
    print(addition(a,b))
}

another(sum: addition, a: 10, b: 20)


// nested function
func calcDecrement(forDecrement total:Int) -> () -> Int{
    var overallDecrement = 0
    
    func decrementer() -> Int {
        overallDecrement -= total
        return overallDecrement
    }
    return decrementer
}

let decrem = calcDecrement(forDecrement: 30)
print(decrem())


func sumOfDouble(no1: Double, no2: Double) -> Double {
    return (no1 + no2)
}
print(sumOfDouble(no1: 1.0, no2: 1.0))


func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

greet(person: "Sagar", alreadyGreeted: false)
greet(person: "Rajan", alreadyGreeted: true)


// defer

func captureTest() {
   var fullName = "VIrat Kohli"
   defer {
       print(fullName)
   }
   fullName = "Virat kohli"
   print(fullName)
}
captureTest()

func mulDefer() {
    defer { print("first")}
    defer { print("Second")}
    defer { print("Third")}
    defer { print("fourth")}
    return print("Function")
}
mulDefer()

for i in 1...3 {
    print ("In \(i)")
    defer { print ("Deferred \(i)") }
    print ("Out \(i)")
}
