//: [Previous](@previous)

import Foundation

//Create an example using swift to demonstrate use of get only properties. Create a class with a property which value cannot be set outside of class.
//Output: for example, your class Demo has one property of string type then you can be able to set it within a class. If I try set it outside of class it must give an error.

class MyData {
    
    private var name: String = "Sagar"
    
    var changeName: String {
        get { return name }
        
        set { name = newValue }
    }
    
}

var myData = MyData()
print(myData.changeName)
myData.changeName = "Rajan"
print(myData.changeName)


//Create a swift program to demonstrate usage of computed properties using getter and setter

class Sum {
    
    var num1: Int = 0
    var num2: Int = 0
    
    var sumOfNum: Int {
        get {
            return num1 + num2
        }
        set {
            num1 = newValue
            num2 = newValue
        }
    }
    
}

var sum = Sum()
sum.sumOfNum
sum.num1 = 10
sum.num2 = 20
sum.sumOfNum


// Create a swift program to show usage of stored properties.

class StoredProperties {
    
    var name = "Sagar"
    var company = "Simform"
    
}

var storedProperties = StoredProperties()
storedProperties.name = "I am Sagar"
storedProperties.company = "Simform Solutions"


//Create a swift program which has private properties which cannot directly be accessed. Means we cannot directly read or write it

class PrivateData {
    
    private var name = "Rohit"
    private var age = 35
    private var salary = 1.0
    
    var getName: String {
        get {
            return name
        }
        set {
            name = newValue
        }
    }
    
    var getAge: Int {
        get {
            return age
        }
        set {
            age = newValue
        }
    }
    
}

var privateData = PrivateData()
privateData.getName
privateData.getAge
privateData.getName = "Rishbh"
privateData.getAge = 25
privateData.getName
privateData.getAge


//Create one swift class which have two properties name and id, the class must have one initializer to set that properties. And create one array of that class types.

class Data {
    
    var name: String
    var id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
}

var data1 = Data(name: "Tarak", id: 1)
var data2 = Data(name: "Iyer", id: 2)

var arrayOfData: [Data] = [data1, data2]
for  i in arrayOfData {
    print("Name: \(i.name), Id: \(i.id)")
}


// Create one example of usage of willSet and didSet.
class SetData {
    
    var yourName: String = "This is Your Name" {
        willSet {
            print("Now New Value is \(newValue)")
        }
        didSet {
            print("Your Old Value is \(oldValue)")
        }
    }
    
}

var setData = SetData()
setData.yourName
setData.yourName = "Ravi Ashwin"

