//: [Previous](@previous)

import Foundation

//Create one class as Base type Person which has common properties like name, occupation, etc. Create two child classes from the person which are Student, Employee and this two-child classes must have base properties and some other properties also. Example, student have college, but Employee have company. And demonstrate the usage of inheritance

class Person {
    
    var name: String
    var occupation: String
    
    init(name: String, occupation: String) {
        self.name = name
        self.occupation = occupation
    }
    
}

class Student: Person {
    
    var college: String
    
    init(name: String, occupation: String, college: String) {
        self.college = college
        super.init(name: name, occupation: occupation)
    }
    
    func display() -> () {
        print("Name: \(name), Occupation: \(occupation), College: \(college)")
    }
    
}

class Employee: Person {
    
    var company: String
    
    init(name: String, occupation: String, company: String) {
        self.company = company
        super.init(name: name, occupation: occupation)
    }
    
    func display() -> () {
        print("Name: \(name), Occupation: \(occupation), Company: \(company)")
    }
    
}

var student = Student(name: "Parh", occupation: "Student", college: "GEC")
student.display()

var employee = Employee(name: "Sagar", occupation: "Developer", company: "Simform")
employee.display()


// Create one structure to show usage of mutating function in swift.

struct ChangeData {
    
    var name: String
    
    mutating func changeValue(name: String) {
        self.name = name
    }
    
}

var changeData = ChangeData(name: "Rahul")
changeData.name
changeData.changeValue(name: "Sagar")
changeData.name


// Create one class inheritance demo to show usage of method overriding

class Bird {
    
    var name = "Bird"
    
    func displayName() {
        print("Class name is:",name)
    }

}

class Sprrow: Bird {
    
    var sprrowName = "Sprrow"
    
    override func displayName() {
        print("Class name is \(sprrowName)")
    }
    
}

var sprrow = Sprrow()
sprrow.displayName()


//Create one swift class to show usage of type methods
//Create one swift class to show usage of type methods static method. Then in one child class try to override that methods and check the output/ error. (you will learn difference between class and static)

class Vehical {
    
    var type: String
    var gear: Int
    
    init(type: String, gear: Int) {
        self.type = type
        self.gear = gear
    }
    
    static func vehicalDetailsStatic() {
        print("This is Static Method Inside Vehical Class")
    }
    
    func vehicalDetails() {
        print("Type: \(type), Gear: \(gear)")
        print("This is Non-Static Method Inside Vehical Class")
    }
    
    
    class func vehicalDetails() {
        print("This is class Method Inside Vehical Class")
    }
    
}

Vehical.vehicalDetailsStatic()
Vehical.vehicalDetails()

var vehical = Vehical(type: "Petrol", gear: 2)
vehical.vehicalDetails()


class Bike: Vehical {
    
    override func vehicalDetails() {
        print("This is Non-Static Method Override inside Bike class")
    }
    
    override class func vehicalDetails() {
        print("This is class Method override inside Bike class")
    }
    
    
}

var bike = Bike(type: "Sport", gear: 6)
bike.vehicalDetails()
Bike.vehicalDetails()


//Create one base class of type Song and create subclasses of music types (Hip-Hop, classical) and show usage of inheritance. // Here Music class have property singer, composer

class Song {
    
    var songType: String
    var songName: String
    
    init(songType: String, songName: String) {
        self.songType = songType
        self.songName = songName
    }
    
    func displayDetails() {
        print(songType, songName)
    }
    
}

class HipHop: Song {
    
    var singer: String
    
    init(songType: String, songName: String, singer: String) {
        self.singer = singer
        super.init(songType: songType, songName: songName)
    }
    
    override func displayDetails() {
        print(songType, songName, singer)
    }
    
}

class Classical: Song {
    
    var composer: String
    
    init(songType: String, songName: String, composer: String) {
        self.composer = composer
        super.init(songType: songType, songName: songName)
    }
    
    override func displayDetails() {
        print(songType, songName, composer)
    }
    
}

var song = Song(songType: "Music", songName: "A")
song.displayDetails()

var hiphop = HipHop(songType: "HipHop", songName: "b", singer: "Me")
hiphop.displayDetails()

var classical = Classical(songType: "Clasical", songName: "c", composer: "You")
classical.displayDetails()


//  Create a swift class with properties which can be read-write outside of class.

class PersonalData {
    
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
}

var personalData = PersonalData(name: "Sagar", id: 1)
personalData.name
personalData.name = "Virat"
personalData.name
