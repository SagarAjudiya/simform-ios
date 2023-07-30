//
//  Student.swift
//  UIComponents
//
//  Created by Sagar Ajudiya on 10/05/23.
//

import Foundation

struct Student {
    
    // MARK: Variable
    var name: String
    var age: Int
    var education: String
    
    // MARK: Array of Students
    static let studentData: [Student] = [
        Student(name: "Sagar", age: 21, education: "BE"),
        Student(name: "Rajan", age: 22, education: "BTech"),
        Student(name: "Priyanshu", age: 23, education: "MSC"),
        Student(name: "Darshan", age: 27, education: "BE"),
        Student(name: "Shyam", age: 32, education: "D2D"),
        Student(name: "Akshay", age: 22, education: "BE"),
        Student(name: "Sahil", age: 30, education: "MTech"),
        Student(name: "Parth", age: 27, education: "BE"),
        Student(name: "Ruchit", age: 23, education: "BSC"),
        Student(name: "Jay", age: 25, education: "BE"),
    ]
    
}
