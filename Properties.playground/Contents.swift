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
