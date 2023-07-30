//: [Previous](@previous)

import Foundation


//Create one structure of type Work, which have some properties like work location, work hours and one string array of project names. And create a function inside structure which returns all project names for the person.

struct Work {
    
    var location: String
    var hours: Double
    var projectNames: [String] = []
    
    func namesOfProject() {
        for project in projectNames {
            print(project)
        }
    }
    

}

var work = Work(location: "Surat", hours: 5, projectNames: ["App", "Web"])

work.namesOfProject()


//Create a structure example which demonstrates use of initializer in structures.

struct Person {
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
}

var person = Person(name: "Virat", age: 34)
person.age
person.name


//Create a structure program which can be initialized with parameters and it also should be able to initialized without parameter

struct Game {
    
    var name: String
    var player: Int
    
    init() {
        self.name = "No Game"
        self.player = 0
    }
    
    init(name: String, player: Int) {
        self.name = name
        self.player = player
    }
    
}

var game1 = Game(name: "Cricket", player: 11)
game1.name
game1.player

var game2 = Game()
game2.player
game2.name


//Create one structure which have initializer which takes array of int as input returns  two arrays one of all even numbers and another of int as input returns  two arrays one of all even numbers and another is all odd numbers.

struct OddEven {
    
    var array: [Int]
    
    init(array: [Int]) {
        self.array = array
    }
    
    func oddEven() -> ([Int], [Int]) {
        var odd: [Int] = array.filter({ $0 % 2 != 0 })
        var even: [Int] = array.filter({ $0 % 2 == 0 })

        print("Odd items",odd)
        print("Even items", even)
        return (odd, even)
    }
    
}

var oddEvenObj = OddEven(array: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12])
oddEvenObj.oddEven()


//Create one swift structure program for person that contains basic details like name, age, gender. Then create one array of person with all details. Print all details of that array.
// Consider two persons array for Joe and Harry. But in your code Its size can be vary.
//Output be like: Name: Joe, Gender: Male, Age: 27
//     Name: Harry, Gender: Male, Age: 21


struct PersonDetails {
    
    var name: String
    var age: Int
    var gender: String
    
    init(name: String, age: Int, gender: String) {
        self.name = name
        self.age  = age
        self.gender = gender
    }
    
    func printdetails() -> () {
        print ([name, age, gender])
        print("Name: \(name), Gender: \(gender), Age: \(age)")
    }
    
}

var person1 = PersonDetails(name: "Virat", age: 34, gender: "Male")
person1.printdetails()

var person2 = PersonDetails(name: "Harry", age: 21, gender: "Male")
person2.printdetails()


//Perform same example given in class question no 10 and check output using structure. Try to find difference between these two outputs and try to figure out the reason for that output.


class StudentClass {
    
   var name: String
   var grade: Int
    
   init(name: String, grade: Int) {
      self.name = name
      self.grade = grade
   }
    
}

let student1 = StudentClass(name: "Sagar", grade: 1)
let student2 = student1
student2.name = "Rohit"
print("student1 name: \(student1.name)")
print("student2 name: \(student2.name)")

struct StudentStruct {
    
   var name: String
   var grade: Int
    
}

let student3 = StudentStruct(name: "Rishbh", grade: 10)
var student4 = student3
student4.name = "Hardik"
print("student3 name: \(student3.name)")
print("student4 name: \(student4.name)")


//Try to figure out basic difference between class and structures and give a demo for same.

// If we assign a object of class to second object then we will change value in second object then value in first object is also changed, because Classes are reference type

// this is not same for Structure because, Struct is value type and when object is created it is create another copy of that object
