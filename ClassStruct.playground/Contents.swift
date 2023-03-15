import UIKit

// struct and class

// struct - value type
// class - reference type

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode  {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("The Width of someResolution is \(someResolution.width)")

someVideoMode.resolution.width = 100
print("The Width of someVideoMode is \(someVideoMode.resolution.width)")


let hd = Resolution(width: 1920, height: 1080)
type(of: hd)
var cinema = hd
type(of: cinema)
cinema.width = 2048
print("The cinema width \((cinema.width))")
print("The hd width \(hd.width)")

struct MarkStruct {
    var mark1: Int
    var mark2: Int
    var mark3: Int
    
    init(mark1: Int, mark2: Int, mark3: Int){
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
}

let marks = MarkStruct(mark1: 30, mark2: 45, mark3: 85)
print(marks.mark1)
print(marks.mark2)
print(marks.mark3)

let fail = MarkStruct(mark1: 14, mark2: 32, mark3: 28)
print(fail.mark1)
print(fail.mark2)
print(fail.mark3)

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberDirection = currentDirection
currentDirection.turnNorth()


let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

print(tenEighty.frameRate)

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print(tenEighty.frameRate)
print(alsoTenEighty.frameRate)

//identical to (represented by three equals signs, or ===) doesn’t mean the same thing as equal to (represented by two equals signs, or ==).
//Identical to means that two constants or variables of class type refer to exactly the same class instance
if tenEighty === alsoTenEighty {
    print("Same reference")
} else {
    print("Different reference")
}
