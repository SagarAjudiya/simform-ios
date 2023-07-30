//: [Previous](@previous)

import Foundation

//Create one example of subscript using array. Create one array of weekdays and one subscript func which takes int as argument and returns day of week.

//Output: WeekDays.subscript(day: 1) // will return Sunday, Note: Handle invalid input

class DaySubscript {
    
    var dayArray = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    subscript(day: Int) -> String {
        get {
            if day > 0 && day <= 7 {
                return dayArray[day - 1]
            }
            return "Invalid Input"
        }
        set {
            if day > 0 && day <= 7 {
                dayArray[day - 1] = newValue
            } else {
                print("Input should between 1 to 7")
            }
        }
    }

}

var daySubscript = DaySubscript()
daySubscript[1]
daySubscript[3]
daySubscript[8] = "Newday"
daySubscript[8]

// Create a swift program to show usage of subscript in string. I pass int argument and it returns the character at given position

struct StrSubscript {
    
    var myString = "This is my String for Subscript"
    
    subscript(pos: Int) -> Character {
        get {
            if myString.count > pos {
                return myString[myString.index(myString.startIndex, offsetBy: pos)]
            }
            return " "
        }
    }
    
}

var str = StrSubscript()
print(str[5])


//Create one swift subscript program which takes range as input and returns the string between the ranges.

class RangeSub {
    
    var myString = "This is my String for Subscript"
    
    subscript(range: Range<Int>) -> Substring {
        
        //seconde way
//        var str = ""
//        for i in range {
//            str.append(myString[myString.index(myString.startIndex, offsetBy: i)])
//        }
//        return str
        
        let start = myString.index(myString.startIndex, offsetBy: range.startIndex)
        let end = myString.index(myString.startIndex, offsetBy: range.endIndex)
     
        return myString[start..<end]
        
    }
    
}

var rangeSub = RangeSub()
rangeSub[0..<6]

//I have one integer array and create one function which takes range as input and returns all elements between the range

struct IntArray {
    
    func rangeEle(array: [Int], startRange: Int, endRange: Int) {
        print(array[startRange...endRange])
    }
    
}

var intArray = IntArray()
let array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
intArray.rangeEle(array: array, startRange: 2, endRange: 6)


// I have one key value pair array. Create one function using subscript which takes key as input and returns it’s value.

struct KeyValue {
    
    let keyValue = [ [1: "one"], [2: "two"], [3: "three"] ]
    
    subscript(key: Int) -> String {
        for element in keyValue {
            if element[key] != nil {
                return element[key]!
            }
        }
        return " "
    }
    
}

var keyValue = KeyValue()
keyValue[2]
keyValue[3]


//Create one array of type Person and create one subscript function which takes person name as input and returns person info like name, age, birthdate etc.

class Person {
    
    var name: String
    var age: Int
    var bithdate: String
    
    init(name: String, age: Int, birthdate: String) {
        self.name = name
        self.age = age
        self.bithdate = birthdate
    }
    
}

var person1 = Person(name: "Rohit", age: 34, birthdate: "21/03/2000")
var person2 = Person(name: "Virat", age: 33, birthdate: "23/01/1999")
var person3 = Person(name: "Rishbh", age: 20, birthdate: "10/03/2001")

var personArray: [Person] = [person1, person2, person3]

class PersonSubscript {
    
    var personArray: [Person]?
    
    subscript(name: String) -> String {
        if let personArray {
            for element in personArray  {
                if element.name == name {
                    var ans = "Name: \(name), Age: \(element.age), Bithdate: \(element.bithdate)"
                    return ans
                }
            }
        }
        return ""
    }

}

var personSubscript = PersonSubscript()
personSubscript.personArray = personArray
print(personSubscript["Virat"])


