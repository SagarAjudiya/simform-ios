import UIKit

var greet = "Hello, playground"

// reserved keyword as a variable using ``
	
var `for` = 123

var digit1 = 10
var digit2 = 23
type(of: digit1)
type(of: digit2)

let possibleNumber = "123.55"
let convertedNumber = Double(possibleNumber)
type(of: convertedNumber)


// String

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""


// Conditional check

var optionalName: String? = "Swift"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
else {
    print("nothing")
}

// Switch case

let vegetable = "celery"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}

let numbersArray = [20, 30, 40, 50, 60, 70, 80, 90, 10]
for num in numbersArray{
    switch num {
    case 10:
        print(num)
    case 20:
        print(num)
    case 30:
        print(num)
        fallthrough
    case 40:
        print(num)
    default:
        print("nothing here")
    }
}

// Arrays

var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList.append("Flour")
shoppingList += ["Baking Powder", "Cheese", "Butter"]

shoppingList[3...5] = ["Bananas", "Apples"]

shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 1)


for i in shoppingList {
    print(i)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// Sets

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
type(of: favoriteGenres)
favoriteGenres.insert("Tool j")
print(favoriteGenres)

if favoriteGenres.contains("Funk") {
    print(true)
} else {
    print(false)
}

for i in favoriteGenres{
    print(i)
}

// sorted list i alphabatical order
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

// Tuple

var product = ("MacBook", 1099.99)

print("Name:", product.0)
print("Price:", product.1)

var alphabets = ("A", "B", "C", ("a", "b", "c"))
print(alphabets.3.1)

var company = ("Programiz","Apple")
//company.2 = "Google"  // we can't add or remove from tuple

// Dictionary inside a tuple
var laptopLaunch = ("MacBook", 1299, ["Nepal": "10 PM", "England": "10 AM"])
print(laptopLaunch.2)
laptopLaunch.2["USA"] = "11 AM"
print(laptopLaunch.2)

// Dictionary

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

for (airCode, airName) in airports {
    print(airCode, airName)
}

for i in airports.keys {
    print(i)
}
for i in airports.values {
    print(i)
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)


// Array of Dictinory of Array

var anArray = [ [ "name" : [ 1, 2, 3 ] ],
                [ "name1" : [ 4, 5, 6 ] ],
                [ "name2" : [ 7, 8, 9 ] ]]
type(of: anArray)

for dictionary in anArray {
    for (_, value) in dictionary {
        for val in value {
            print(val)
        }
    }
}

// For loop

for i in 1...5 {
    print(i)
}

// if

func voteEligibilityFunction() {
  var age = 42
  if age >= 18 {
  print("Eligible to vote")
  }
  else {
  print("Not eligible to vote")
  }
}

voteEligibilityFunction()

// guard

func voteEligibility() {
  let age = 42
  guard age >= 18 else {
      print("Not Eligible to vote")
      return
  }
  print("Eligible to vote")
}

voteEligibility()


// value type - struct,enum,array,dictionary,tuple,


let colors : [String]? = ["red", "green", "blue"]
let nullableGreen : String? = "green"

if var green = nullableGreen,
  var index = colors?.firstIndex(where: {$0.elementsEqual(green)}) {
    print("\(green) is present in palette at position \(index)")
} else {
    print("\(nullableGreen ?? "undefined") is not present in palette")
}


for i in 1..<100 where(pow(2, i) <= 100){
    print(pow(2,i))
}


let string: String? = "checkmate"
if let string {
    print("game over")
} else {
    print("let's play")
}


let names = ["Shubham", "Anurag", "NagesWer", "Adele", "Sumit"]
for name in names where name.hasPrefix("Anurag") {
    print(name)
}

var a: String = "6"
var b = Int(a)
//var b  = (a as! Int)


let dict1 = ["Name" : "Wanda", "Age" : 32, "Gender" : "Female"] as [String : Any]
type(of: dict1)

let fruits = ["Banana", "Apple", "Kiwi"]
print(fruits.map{$0.count})

var country = "India"
for character in country {
    print(character)
}


// remove decimal from string
var combination = "bhuve56458hacbhgergjv894"
let strChar = combination.components(separatedBy: CharacterSet.decimalDigits).joined()


var str = "abcbca"
var str2 = str.sorted()
var cnt = true

for i in stride(from: 0, to: str.count-1, by: +2) {
    if str2[i] != str2[i+1] {
        cnt = false
        print(i)
        break
    }
    print(i)

}
print(cnt)

class xyz {

}

var a = xyz()

var arr2: [Any?] = []
arr2.append(2)
arr2.append("dsub")
arr2.append(63.89)
arr2.append(Int(57.76))
arr2.append(xyz())


var dictUser: [String : Any] = [:]
dictUser["name"] = "abc"
dictUser["age"] = 20
dictUser["history"] = arr2


var arr1: [Any?] = []
arr1.append(2)
arr1.append("dsub")
arr1.append(63.89)
arr1.append(Int(57.76))
arr1.append(xyz())
arr1.append(dictUser)


for element in arr1 {
    if let dict = element as? [String : Any] {
        print(dict)
        
        if let valueOfkey = dict["history"] as? [Any?] {
            print(valueOfkey)
            
            for index in valueOfkey {
                if let num = index as? Int {
                    print("Int \(num)")
                } else if let str = index as? String {
                    print("String \(str)")
                } else if let dbl = index as? Double {
                    print("Double \(dbl)")
                }
            }
        }
    }
}

var str = "Sagar"

var newStr = str.firstIndex(of: "g")

if let newStr {
    str.replaceSubrange(newStr...newStr, with: "h")
//    str.replace("r", with: "d")
}

if let range = str.firstRange(of: "a") {
    str.replacingCharacters(in: range, with: "d")
}

str.replacingOccurrences(of: "a", with: "z")


let myNum: Int

myNum = 1000

print(myNum)


var arrayOne = [
   [
       "name": "pD",
       "name1": "pD",
       "new": ["nre": "pD", "helo": "name"]
   ],
   [
       "name": "DD",
       "name1": "pD",
       "new": [:]
   ],
   [
       "name": "GD",
       "name1": "pD",
       "abd": 78,
       "new": [6890, "tvtby", 7890, 55.01]
   ],
   [
       "name": "GD",
       "name1": "pD",
       "abd": 78,
       "new": 465454
   ],
   [
       "name": "AD",
       "name1": "pD",
       "new": ["nre": "pD", "helo": "name"]
   ],
]


for element in arrayOne {
   var elementObj = element["new"]
   switch(elementObj) {
   case is [String: String]:
       print("Dictionary \(elementObj as? [String: String] ?? [:]) ")
   case is [Any]:
       print("Array \(elementObj  ?? "Array is empty")")
   case is Int:
       print("Int \(elementObj ?? "int is not found")")
   default:
       print(type(of: elementObj))
   }

////    Second Way
//    if let dictionary = elementObj as? [String : String] {
////        print(keys)
//
//        for (key, value) in dictionary {
//            print("key: \(key), value: \(value)")
//        }
//
//    } else if let array = element["new"] as? [Any] {
//        for i in array {
//            print(i)
//        }
//    }

	
}




var student: [[String: Any]] = [
    
    ["Name": "Sagar",
     "year": 2017,
     "degree": "BE",
     "siblings" : [ "Name": "Sagar",
                    "year": 2017,
                    "degree": "BE"
                  ]
    ]
    
]


for element in student {
    if let year = element["year"] {
        print("Year is \(year)")
    }
    
    if let sib = element["siblings"] as? [String: Any] {
        if let sibYear = sib["year"] {
            print("Sibling Year \(sibYear)")
        }
    }
}
