import UIKit

// function calling and syntax
func student(name: String) -> String{
    return name
}
print(student(name: "Rajan"))
print(student(name: "Sagar"))


// parameter and return value
func multiplication(no1: Int, no2: Int) -> Int {
    return no1 * no2
}
print(multiplication(no1: 5, no2: 2))


// function without parameter
func yourName() -> String {
    return ("Sagar")
}
print(yourName())


// return multiple value
func ls(array:[Int]) -> (large:Int, small:Int) {
    var l = array[0]
    var s = array[0]
    
    for i in array{
        if i < s {
            s = i
        }
        else if i > l{
            l = i
        }
    }
    return (l, s)
}

let num = ls(array: [40,12,-5,78,98])
print("Largest number is: \(num.large) and smallest number is: \(num.small)")


// without return values
func summ(a:Int, b:Int){
    var a = a + b
    var b = a - b
    print(a, b)
}

summ(a: 10, b: 5)


// array with optional return type
func minMax(array:[Int]) -> (min:Int, max:Int)? {
    if array.isEmpty { return nil }
    
    var curMin = array[0]
    var curMax = array[0]
    
    for i in array[1..<array.count]{
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
func pow(first a: Int, second b: Int){
    var res = a
    for _ in 1..<b {
        res = res * a
    }
    print(res)
}
pow(first: 5, second: 3)


// variadic parameters
func vari(_ members: Any...){
   for i in members {
      print(i)
   }
}

vari(1,2,3,4)
vari("Swift 4", "Enumerations", "Closures")


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
func input( ) {
    print("Swift is Owsmm")
}
input()


// using function type
//var addition : (Int, Int) -> Int = summ

func sum (a:Int, b:Int) -> Int {
    return a + b
}

var addition: (Int, Int) -> Int = sum

print(addition(40,40))


// function as parameter and return type
func another(addition: (Int, Int) -> Int, a:Int, b:Int){
    print(addition(a,b))
}
 
another(addition: sum(a:b:), a: 10, b: 20)


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
